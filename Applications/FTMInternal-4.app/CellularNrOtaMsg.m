@interface CellularNrOtaMsg
- (BOOL)hasBwp;
- (BOOL)hasCellId;
- (BOOL)hasChannel;
- (BOOL)hasContent;
- (BOOL)hasDeployment;
- (BOOL)hasDlBw;
- (BOOL)hasFreq;
- (BOOL)hasFreqBandInd;
- (BOOL)hasFreqRange;
- (BOOL)hasLength;
- (BOOL)hasLteBw;
- (BOOL)hasLteGci;
- (BOOL)hasMsgType;
- (BOOL)hasNumMncDigits;
- (BOOL)hasNumSubs;
- (BOOL)hasPhyCellId;
- (BOOL)hasPsPref;
- (BOOL)hasRbId;
- (BOOL)hasSelPlmnMcc;
- (BOOL)hasSelPlmnMnc;
- (BOOL)hasSplitBearerEver;
- (BOOL)hasSsbCount;
- (BOOL)hasSubCarrierSpacing;
- (BOOL)hasSubsId;
- (BOOL)hasTddUlDlConfigurationCommon;
- (BOOL)hasTimestamp;
- (BOOL)hasTrackingAreaCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)splitBearerEver;
- (NSData)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)channel;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bwp;
- (unsigned)cellId;
- (unsigned)deployment;
- (unsigned)dlBw;
- (unsigned)freq;
- (unsigned)freqBandInd;
- (unsigned)freqRange;
- (unsigned)length;
- (unsigned)lteBw;
- (unsigned)lteGci;
- (unsigned)msgType;
- (unsigned)numMncDigits;
- (unsigned)numSubs;
- (unsigned)phyCellId;
- (unsigned)psPref;
- (unsigned)rbId;
- (unsigned)selPlmnMcc;
- (unsigned)selPlmnMnc;
- (unsigned)ssbCount;
- (unsigned)subCarrierSpacing;
- (unsigned)subsId;
- (unsigned)tddUlDlConfigurationCommon;
- (unsigned)trackingAreaCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBwp:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setChannel:(int)a3;
- (void)setContent:(id)a3;
- (void)setDeployment:(unsigned int)a3;
- (void)setDlBw:(unsigned int)a3;
- (void)setFreq:(unsigned int)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setFreqRange:(unsigned int)a3;
- (void)setHasBwp:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasDeployment:(BOOL)a3;
- (void)setHasDlBw:(BOOL)a3;
- (void)setHasFreq:(BOOL)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasFreqRange:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLteBw:(BOOL)a3;
- (void)setHasLteGci:(BOOL)a3;
- (void)setHasMsgType:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPhyCellId:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRbId:(BOOL)a3;
- (void)setHasSelPlmnMcc:(BOOL)a3;
- (void)setHasSelPlmnMnc:(BOOL)a3;
- (void)setHasSplitBearerEver:(BOOL)a3;
- (void)setHasSsbCount:(BOOL)a3;
- (void)setHasSubCarrierSpacing:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTddUlDlConfigurationCommon:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrackingAreaCode:(BOOL)a3;
- (void)setLength:(unsigned int)a3;
- (void)setLteBw:(unsigned int)a3;
- (void)setLteGci:(unsigned int)a3;
- (void)setMsgType:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPhyCellId:(unsigned int)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRbId:(unsigned int)a3;
- (void)setSelPlmnMcc:(unsigned int)a3;
- (void)setSelPlmnMnc:(unsigned int)a3;
- (void)setSplitBearerEver:(BOOL)a3;
- (void)setSsbCount:(unsigned int)a3;
- (void)setSubCarrierSpacing:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTddUlDlConfigurationCommon:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrackingAreaCode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrOtaMsg

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPhyCellId
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_freq = a3;
}

- (void)setHasFreq:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFreq
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRbId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_rbId = a3;
}

- (void)setHasRbId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRbId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setChannel:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMsgType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_msgType = a3;
}

- (void)setHasMsgType:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMsgType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLength:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLength
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlBw
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFreqBandInd
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumMncDigits
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDeployment:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDeployment
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFreqRange
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLteGci:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_lteGci = a3;
}

- (void)setHasLteGci:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLteGci
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLteBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lteBw = a3;
}

- (void)setHasLteBw:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLteBw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBwp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_bwp = a3;
}

- (void)setHasBwp:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBwp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSsbCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_ssbCount = a3;
}

- (void)setHasSsbCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSsbCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSubCarrierSpacing:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_subCarrierSpacing = a3;
}

- (void)setHasSubCarrierSpacing:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubCarrierSpacing
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTddUlDlConfigurationCommon:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_tddUlDlConfigurationCommon = a3;
}

- (void)setHasTddUlDlConfigurationCommon:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTddUlDlConfigurationCommon
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSplitBearerEver:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_splitBearerEver = a3;
}

- (void)setHasSplitBearerEver:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasSplitBearerEver
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPsPref
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrOtaMsg;
  int v3 = [(CellularNrOtaMsg *)&v7 description];
  v4 = [(CellularNrOtaMsg *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if (*(unsigned char *)&has)
  {
    v10 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v10 forKey:@"timestamp"];

    $816A9F7056A322B43461E2DBEB40330F has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v11 = +[NSNumber numberWithUnsignedInt:self->_phyCellId];
  [v3 setObject:v11 forKey:@"phy_cell_id"];

  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  v12 = +[NSNumber numberWithUnsignedInt:self->_freq];
  [v3 setObject:v12 forKey:@"freq"];

  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  v13 = +[NSNumber numberWithUnsignedInt:self->_rbId];
  [v3 setObject:v13 forKey:@"rb_id"];

  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  v14 = +[NSNumber numberWithInt:self->_channel];
  [v3 setObject:v14 forKey:@"channel"];

  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_39:
  v15 = +[NSNumber numberWithUnsignedInt:self->_msgType];
  [v3 setObject:v15 forKey:@"msg_type"];

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    v5 = +[NSNumber numberWithUnsignedInt:self->_length];
    [v3 setObject:v5 forKey:@"length"];
  }
LABEL_9:
  content = self->_content;
  if (content) {
    [v3 setObject:content forKey:@"content"];
  }
  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_dlBw];
    [v3 setObject:v16 forKey:@"dl_bw"];

    $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
    if ((*(unsigned char *)&v7 & 4) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v7 & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&v7 & 4) == 0)
  {
    goto LABEL_13;
  }
  v17 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v17 forKey:@"cell_id"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  v18 = +[NSNumber numberWithUnsignedInt:self->_freqBandInd];
  [v3 setObject:v18 forKey:@"freq_band_ind"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  v19 = +[NSNumber numberWithUnsignedInt:self->_trackingAreaCode];
  [v3 setObject:v19 forKey:@"tracking_area_code"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  v20 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMcc];
  [v3 setObject:v20 forKey:@"sel_plmn_mcc"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  v21 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMnc];
  [v3 setObject:v21 forKey:@"sel_plmn_mnc"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  v22 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
  [v3 setObject:v22 forKey:@"num_mnc_digits"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  v23 = +[NSNumber numberWithUnsignedInt:self->_deployment];
  [v3 setObject:v23 forKey:@"deployment"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  v24 = +[NSNumber numberWithUnsignedInt:self->_freqRange];
  [v3 setObject:v24 forKey:@"freq_range"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  v25 = +[NSNumber numberWithUnsignedInt:self->_lteGci];
  [v3 setObject:v25 forKey:@"lte_gci"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  v26 = +[NSNumber numberWithUnsignedInt:self->_lteBw];
  [v3 setObject:v26 forKey:@"lte_bw"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  v27 = +[NSNumber numberWithUnsignedInt:self->_bwp];
  [v3 setObject:v27 forKey:@"bwp"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  v28 = +[NSNumber numberWithUnsignedInt:self->_ssbCount];
  [v3 setObject:v28 forKey:@"ssb_count"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  v29 = +[NSNumber numberWithUnsignedInt:self->_subCarrierSpacing];
  [v3 setObject:v29 forKey:@"sub_carrier_spacing"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  v30 = +[NSNumber numberWithUnsignedInt:self->_tddUlDlConfigurationCommon];
  [v3 setObject:v30 forKey:@"tdd_ul_dl_configuration_common"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  v31 = +[NSNumber numberWithBool:self->_splitBearerEver];
  [v3 setObject:v31 forKey:@"split_bearer_ever"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  v32 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v32 forKey:@"subs_id"];

  $816A9F7056A322B43461E2DBEB40330F v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_58:
  v33 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v33 forKey:@"num_subs"];

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_30:
    v8 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v8 forKey:@"ps_pref"];
  }
LABEL_31:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C4C30((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $816A9F7056A322B43461E2DBEB40330F has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_content) {
    PBDataWriterWriteDataField();
  }
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
    if ((*(unsigned char *)&v5 & 4) == 0)
    {
LABEL_14:
      if ((*(unsigned char *)&v5 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&v5 & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v5 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(unsigned char *)&v5 & 2) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v5 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $816A9F7056A322B43461E2DBEB40330F v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
LABEL_30:
  }
    PBDataWriterWriteUint32Field();
LABEL_31:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 32) |= 1u;
    $816A9F7056A322B43461E2DBEB40330F has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 28) = self->_subsId;
  *((_DWORD *)v4 + 32) |= 0x400000u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 21) = self->_phyCellId;
  *((_DWORD *)v4 + 32) |= 0x8000u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 12) = self->_freq;
  *((_DWORD *)v4 + 32) |= 0x40u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 23) = self->_rbId;
  *((_DWORD *)v4 + 32) |= 0x20000u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 6) = self->_channel;
  *((_DWORD *)v4 + 32) |= 8u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_40:
  *((_DWORD *)v4 + 18) = self->_msgType;
  *((_DWORD *)v4 + 32) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 15) = self->_length;
    *((_DWORD *)v4 + 32) |= 0x200u;
  }
LABEL_10:
  if (self->_content)
  {
    $816A9F7056A322B43461E2DBEB40330F v7 = v4;
    [v4 setContent:];
    v4 = v7;
  }
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_dlBw;
    *((_DWORD *)v4 + 32) |= 0x20u;
    $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
    if ((*(unsigned char *)&v6 & 4) == 0)
    {
LABEL_14:
      if ((*(unsigned char *)&v6 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&v6 & 4) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_DWORD *)v4 + 32) |= 4u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 13) = self->_freqBandInd;
  *((_DWORD *)v4 + 32) |= 0x80u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 30) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 32) |= 0x1000000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 24) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 32) |= 0x40000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 25) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 32) |= 0x80000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 19) = self->_numMncDigits;
  *((_DWORD *)v4 + 32) |= 0x2000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 10) = self->_deployment;
  *((_DWORD *)v4 + 32) |= 0x10u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 14) = self->_freqRange;
  *((_DWORD *)v4 + 32) |= 0x100u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 17) = self->_lteGci;
  *((_DWORD *)v4 + 32) |= 0x800u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 16) = self->_lteBw;
  *((_DWORD *)v4 + 32) |= 0x400u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 4) = self->_bwp;
  *((_DWORD *)v4 + 32) |= 2u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 26) = self->_ssbCount;
  *((_DWORD *)v4 + 32) |= 0x100000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 27) = self->_subCarrierSpacing;
  *((_DWORD *)v4 + 32) |= 0x200000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 29) = self->_tddUlDlConfigurationCommon;
  *((_DWORD *)v4 + 32) |= 0x800000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v4 + 124) = self->_splitBearerEver;
  *((_DWORD *)v4 + 32) |= 0x2000000u;
  $816A9F7056A322B43461E2DBEB40330F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_58:
  *((_DWORD *)v4 + 20) = self->_numSubs;
  *((_DWORD *)v4 + 32) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_30:
    *((_DWORD *)v4 + 22) = self->_psPref;
    *((_DWORD *)v4 + 32) |= 0x10000u;
  }
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  $816A9F7056A322B43461E2DBEB40330F v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $816A9F7056A322B43461E2DBEB40330F v6 = v5;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 32) |= 1u;
    $816A9F7056A322B43461E2DBEB40330F has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 28) = self->_subsId;
  *((_DWORD *)v5 + 32) |= 0x400000u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 21) = self->_phyCellId;
  *((_DWORD *)v5 + 32) |= 0x8000u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 12) = self->_freq;
  *((_DWORD *)v5 + 32) |= 0x40u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 23) = self->_rbId;
  *((_DWORD *)v5 + 32) |= 0x20000u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 6) = self->_channel;
  *((_DWORD *)v5 + 32) |= 8u;
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_36:
  *((_DWORD *)v5 + 18) = self->_msgType;
  *((_DWORD *)v5 + 32) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 15) = self->_length;
    *((_DWORD *)v5 + 32) |= 0x200u;
  }
LABEL_10:
  id v8 = [(NSData *)self->_content copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_dlBw;
    *((_DWORD *)v6 + 32) |= 0x20u;
    $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
    if ((*(unsigned char *)&v10 & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v10 & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&v10 & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 5) = self->_cellId;
  *((_DWORD *)v6 + 32) |= 4u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v10 & 0x1000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 13) = self->_freqBandInd;
  *((_DWORD *)v6 + 32) |= 0x80u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v10 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 30) = self->_trackingAreaCode;
  *((_DWORD *)v6 + 32) |= 0x1000000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 24) = self->_selPlmnMcc;
  *((_DWORD *)v6 + 32) |= 0x40000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 25) = self->_selPlmnMnc;
  *((_DWORD *)v6 + 32) |= 0x80000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v10 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 19) = self->_numMncDigits;
  *((_DWORD *)v6 + 32) |= 0x2000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 10) = self->_deployment;
  *((_DWORD *)v6 + 32) |= 0x10u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 14) = self->_freqRange;
  *((_DWORD *)v6 + 32) |= 0x100u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v10 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v6 + 17) = self->_lteGci;
  *((_DWORD *)v6 + 32) |= 0x800u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v10 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v6 + 16) = self->_lteBw;
  *((_DWORD *)v6 + 32) |= 0x400u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 2) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v6 + 4) = self->_bwp;
  *((_DWORD *)v6 + 32) |= 2u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v10 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v6 + 26) = self->_ssbCount;
  *((_DWORD *)v6 + 32) |= 0x100000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v10 & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v6 + 27) = self->_subCarrierSpacing;
  *((_DWORD *)v6 + 32) |= 0x200000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v10 & 0x2000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v6 + 29) = self->_tddUlDlConfigurationCommon;
  *((_DWORD *)v6 + 32) |= 0x800000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v10 & 0x4000) == 0) {
      goto LABEL_27;
    }
LABEL_54:
    *((_DWORD *)v6 + 20) = self->_numSubs;
    *((_DWORD *)v6 + 32) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x10000) == 0) {
      return v6;
    }
    goto LABEL_28;
  }
LABEL_53:
  *((unsigned char *)v6 + 124) = self->_splitBearerEver;
  *((_DWORD *)v6 + 32) |= 0x2000000u;
  $816A9F7056A322B43461E2DBEB40330F v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0) {
    goto LABEL_54;
  }
LABEL_27:
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
LABEL_28:
    *((_DWORD *)v6 + 22) = self->_psPref;
    *((_DWORD *)v6 + 32) |= 0x10000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_138;
  }
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  int v6 = *((_DWORD *)v4 + 32);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_138;
    }
  }
  else if (v6)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_subsId != *((_DWORD *)v4 + 28)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_phyCellId != *((_DWORD *)v4 + 21)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_freq != *((_DWORD *)v4 + 12)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_rbId != *((_DWORD *)v4 + 23)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_channel != *((_DWORD *)v4 + 6)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_msgType != *((_DWORD *)v4 + 18)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_length != *((_DWORD *)v4 + 15)) {
      goto LABEL_138;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_138;
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](content, "isEqual:")) {
      goto LABEL_138;
    }
    $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 32);
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_dlBw != *((_DWORD *)v4 + 11)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 13)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 30)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 24)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 25)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 19)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_deployment != *((_DWORD *)v4 + 10)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_freqRange != *((_DWORD *)v4 + 14)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_lteGci != *((_DWORD *)v4 + 17)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_lteBw != *((_DWORD *)v4 + 16)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_bwp != *((_DWORD *)v4 + 4)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_ssbCount != *((_DWORD *)v4 + 26)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_subCarrierSpacing != *((_DWORD *)v4 + 27)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_tddUlDlConfigurationCommon != *((_DWORD *)v4 + 29)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) != 0)
    {
      if (self->_splitBearerEver)
      {
        if (!*((unsigned char *)v4 + 124)) {
          goto LABEL_138;
        }
        goto LABEL_128;
      }
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_128;
      }
    }
LABEL_138:
    BOOL v9 = 0;
    goto LABEL_139;
  }
  if ((v8 & 0x2000000) != 0) {
    goto LABEL_138;
  }
LABEL_128:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_numSubs != *((_DWORD *)v4 + 20)) {
      goto LABEL_138;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_psPref != *((_DWORD *)v4 + 22)) {
      goto LABEL_138;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x10000) == 0;
  }
LABEL_139:

  return v9;
}

- (unint64_t)hash
{
  $816A9F7056A322B43461E2DBEB40330F has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v32 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_subsId;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v32 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_phyCellId;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_freq;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_rbId;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_channel;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_msgType;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_length;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
LABEL_18:
  unint64_t v11 = (unint64_t)[(NSData *)self->_content hash];
  $816A9F7056A322B43461E2DBEB40330F v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
    uint64_t v13 = 2654435761 * self->_dlBw;
    if ((*(unsigned char *)&v12 & 4) != 0)
    {
LABEL_20:
      uint64_t v14 = 2654435761 * self->_cellId;
      if ((*(unsigned char *)&v12 & 0x80) != 0) {
        goto LABEL_21;
      }
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&v12 & 4) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
LABEL_21:
    uint64_t v15 = 2654435761 * self->_freqBandInd;
    if ((*(_DWORD *)&v12 & 0x1000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
LABEL_22:
    uint64_t v16 = 2654435761 * self->_trackingAreaCode;
    if ((*(_DWORD *)&v12 & 0x40000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
LABEL_23:
    uint64_t v17 = 2654435761 * self->_selPlmnMcc;
    if ((*(_DWORD *)&v12 & 0x80000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_24:
    uint64_t v18 = 2654435761 * self->_selPlmnMnc;
    if ((*(_WORD *)&v12 & 0x2000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
LABEL_25:
    uint64_t v19 = 2654435761 * self->_numMncDigits;
    if ((*(unsigned char *)&v12 & 0x10) != 0) {
      goto LABEL_26;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
LABEL_26:
    uint64_t v20 = 2654435761 * self->_deployment;
    if ((*(_WORD *)&v12 & 0x100) != 0) {
      goto LABEL_27;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
LABEL_27:
    uint64_t v21 = 2654435761 * self->_freqRange;
    if ((*(_WORD *)&v12 & 0x800) != 0) {
      goto LABEL_28;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_28:
    uint64_t v22 = 2654435761 * self->_lteGci;
    if ((*(_WORD *)&v12 & 0x400) != 0) {
      goto LABEL_29;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v22 = 0;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
LABEL_29:
    uint64_t v23 = 2654435761 * self->_lteBw;
    if ((*(unsigned char *)&v12 & 2) != 0) {
      goto LABEL_30;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
LABEL_30:
    uint64_t v24 = 2654435761 * self->_bwp;
    if ((*(_DWORD *)&v12 & 0x100000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_31:
    uint64_t v25 = 2654435761 * self->_ssbCount;
    if ((*(_DWORD *)&v12 & 0x200000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) != 0)
  {
LABEL_32:
    uint64_t v26 = 2654435761 * self->_subCarrierSpacing;
    if ((*(_DWORD *)&v12 & 0x800000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
LABEL_33:
    uint64_t v27 = 2654435761 * self->_tddUlDlConfigurationCommon;
    if ((*(_DWORD *)&v12 & 0x2000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
LABEL_34:
    uint64_t v28 = 2654435761 * self->_splitBearerEver;
    if ((*(_WORD *)&v12 & 0x4000) != 0) {
      goto LABEL_35;
    }
LABEL_53:
    uint64_t v29 = 0;
    if ((*(_DWORD *)&v12 & 0x10000) != 0) {
      goto LABEL_36;
    }
LABEL_54:
    uint64_t v30 = 0;
    return v4 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_52:
  uint64_t v28 = 0;
  if ((*(_WORD *)&v12 & 0x4000) == 0) {
    goto LABEL_53;
  }
LABEL_35:
  uint64_t v29 = 2654435761 * self->_numSubs;
  if ((*(_DWORD *)&v12 & 0x10000) == 0) {
    goto LABEL_54;
  }
LABEL_36:
  uint64_t v30 = 2654435761 * self->_psPref;
  return v4 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 32);
    if ((v5 & 0x400000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((v5 & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_phyCellId = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_freq = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x20000) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_rbId = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_channel = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_40:
  self->_msgType = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_9:
    self->_length = *((_DWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_10:
  if (*((void *)v4 + 4))
  {
    id v7 = v4;
    -[CellularNrOtaMsg setContent:](self, "setContent:");
    id v4 = v7;
  }
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x20) != 0)
  {
    self->_dlBw = *((_DWORD *)v4 + 11);
    *(_DWORD *)&self->_has |= 0x20u;
    int v6 = *((_DWORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_14:
      if ((v6 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_44;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_14;
  }
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_15:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_freqBandInd = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_16:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_trackingAreaCode = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x40000) == 0)
  {
LABEL_17:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_selPlmnMcc = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_selPlmnMnc = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_numMncDigits = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_deployment = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_freqRange = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x800) == 0)
  {
LABEL_22:
    if ((v6 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_lteGci = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x400) == 0)
  {
LABEL_23:
    if ((v6 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_lteBw = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 2) == 0)
  {
LABEL_24:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_bwp = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x100000) == 0)
  {
LABEL_25:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_ssbCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_subCarrierSpacing = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_tddUlDlConfigurationCommon = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_splitBearerEver = *((unsigned char *)v4 + 124);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x4000) == 0)
  {
LABEL_29:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_58:
  self->_numSubs = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 32) & 0x10000) != 0)
  {
LABEL_30:
    self->_psPref = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_31:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)freq
{
  return self->_freq;
}

- (unsigned)rbId
{
  return self->_rbId;
}

- (int)channel
{
  return self->_channel;
}

- (unsigned)msgType
{
  return self->_msgType;
}

- (unsigned)length
{
  return self->_length;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
}

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)deployment
{
  return self->_deployment;
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (unsigned)lteGci
{
  return self->_lteGci;
}

- (unsigned)lteBw
{
  return self->_lteBw;
}

- (unsigned)bwp
{
  return self->_bwp;
}

- (unsigned)ssbCount
{
  return self->_ssbCount;
}

- (unsigned)subCarrierSpacing
{
  return self->_subCarrierSpacing;
}

- (unsigned)tddUlDlConfigurationCommon
{
  return self->_tddUlDlConfigurationCommon;
}

- (BOOL)splitBearerEver
{
  return self->_splitBearerEver;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
}

@end