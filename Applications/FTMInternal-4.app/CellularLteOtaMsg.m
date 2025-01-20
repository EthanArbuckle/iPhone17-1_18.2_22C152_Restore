@interface CellularLteOtaMsg
- (BOOL)hasCellId;
- (BOOL)hasChannelType;
- (BOOL)hasContent;
- (BOOL)hasDlBw;
- (BOOL)hasDlCcchMsg;
- (BOOL)hasDlDcchMsg;
- (BOOL)hasFreq;
- (BOOL)hasFreqBandInd;
- (BOOL)hasLength;
- (BOOL)hasMcchMsg;
- (BOOL)hasMsgType;
- (BOOL)hasNumMncDigits;
- (BOOL)hasPhyCellId;
- (BOOL)hasRbId;
- (BOOL)hasScgEverConfigured;
- (BOOL)hasSelPlmnMcc;
- (BOOL)hasSelPlmnMnc;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTrackingAreaCode;
- (BOOL)hasUlCcchMsg;
- (BOOL)hasUlDcchMsg;
- (BOOL)hasUpperLayerIndication;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)scgEverConfigured;
- (BOOL)upperLayerIndication;
- (NSData)content;
- (id)channelTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dlCcchMsgAsString:(int)a3;
- (id)dlDcchMsgAsString:(int)a3;
- (id)mcchMsgAsString:(int)a3;
- (id)ulCcchMsgAsString:(int)a3;
- (id)ulDcchMsgAsString:(int)a3;
- (int)StringAsChannelType:(id)a3;
- (int)StringAsDlCcchMsg:(id)a3;
- (int)StringAsDlDcchMsg:(id)a3;
- (int)StringAsMcchMsg:(id)a3;
- (int)StringAsUlCcchMsg:(id)a3;
- (int)StringAsUlDcchMsg:(id)a3;
- (int)channelType;
- (int)dlCcchMsg;
- (int)dlDcchMsg;
- (int)mcchMsg;
- (int)ulCcchMsg;
- (int)ulDcchMsg;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cellId;
- (unsigned)dlBw;
- (unsigned)freq;
- (unsigned)freqBandInd;
- (unsigned)length;
- (unsigned)msgType;
- (unsigned)numMncDigits;
- (unsigned)phyCellId;
- (unsigned)rbId;
- (unsigned)selPlmnMcc;
- (unsigned)selPlmnMnc;
- (unsigned)subsId;
- (unsigned)trackingAreaCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setChannelType:(int)a3;
- (void)setContent:(id)a3;
- (void)setDlBw:(unsigned int)a3;
- (void)setDlCcchMsg:(int)a3;
- (void)setDlDcchMsg:(int)a3;
- (void)setFreq:(unsigned int)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasChannelType:(BOOL)a3;
- (void)setHasDlBw:(BOOL)a3;
- (void)setHasDlCcchMsg:(BOOL)a3;
- (void)setHasDlDcchMsg:(BOOL)a3;
- (void)setHasFreq:(BOOL)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasMcchMsg:(BOOL)a3;
- (void)setHasMsgType:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasPhyCellId:(BOOL)a3;
- (void)setHasRbId:(BOOL)a3;
- (void)setHasScgEverConfigured:(BOOL)a3;
- (void)setHasSelPlmnMcc:(BOOL)a3;
- (void)setHasSelPlmnMnc:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrackingAreaCode:(BOOL)a3;
- (void)setHasUlCcchMsg:(BOOL)a3;
- (void)setHasUlDcchMsg:(BOOL)a3;
- (void)setHasUpperLayerIndication:(BOOL)a3;
- (void)setLength:(unsigned int)a3;
- (void)setMcchMsg:(int)a3;
- (void)setMsgType:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setPhyCellId:(unsigned int)a3;
- (void)setRbId:(unsigned int)a3;
- (void)setScgEverConfigured:(BOOL)a3;
- (void)setSelPlmnMcc:(unsigned int)a3;
- (void)setSelPlmnMnc:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrackingAreaCode:(unsigned int)a3;
- (void)setUlCcchMsg:(int)a3;
- (void)setUlDcchMsg:(int)a3;
- (void)setUpperLayerIndication:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteOtaMsg

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPhyCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
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
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFreq
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRbId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rbId = a3;
}

- (void)setHasRbId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRbId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)channelType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_channelType;
  }
  else {
    return 8;
  }
}

- (void)setChannelType:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_channelType = a3;
}

- (void)setHasChannelType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasChannelType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)channelTypeAsString:(int)a3
{
  if ((a3 - 8) >= 8)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100288678[a3 - 8];
  }

  return v3;
}

- (int)StringAsChannelType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BCCH_BCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BCCH_DL_SCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MCCH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PCCH"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"DL_CCCH"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"DL_DCCH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"UL_CCCH"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"UL_DCCH"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 8;
  }

  return v4;
}

- (void)setMsgType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_msgType = a3;
}

- (void)setHasMsgType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMsgType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLength:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLength
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlBw
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFreqBandInd
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumMncDigits
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setUpperLayerIndication:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_upperLayerIndication = a3;
}

- (void)setHasUpperLayerIndication:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUpperLayerIndication
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setScgEverConfigured:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_scgEverConfigured = a3;
}

- (void)setHasScgEverConfigured:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasScgEverConfigured
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)mcchMsg
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_mcchMsg;
  }
  else {
    return 0;
  }
}

- (void)setMcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mcchMsg = a3;
}

- (void)setHasMcchMsg:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMcchMsg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)mcchMsgAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"lte_rrc_MBMSCountingRequest_r10";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"lte_rrc_MBSFNAreaConfiguration_r9";
  }
  return v4;
}

- (int)StringAsMcchMsg:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"lte_rrc_MBSFNAreaConfiguration_r9"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"lte_rrc_MBMSCountingRequest_r10"];
  }

  return v4;
}

- (int)ulCcchMsg
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_ulCcchMsg;
  }
  else {
    return 0;
  }
}

- (void)setUlCcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulCcchMsg = a3;
}

- (void)setHasUlCcchMsg:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlCcchMsg
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)ulCcchMsgAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"lte_rrc_rrcConnectionRequest";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"lte_rrc_rrcConnectionReestablishmentRequest";
  }
  return v4;
}

- (int)StringAsUlCcchMsg:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReestablishmentRequest"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"lte_rrc_rrcConnectionRequest"];
  }

  return v4;
}

- (int)ulDcchMsg
{
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    return self->_ulDcchMsg;
  }
  else {
    return 0;
  }
}

- (void)setUlDcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_ulDcchMsg = a3;
}

- (void)setHasUlDcchMsg:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUlDcchMsg
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)ulDcchMsgAsString:(int)a3
{
  if (a3 >= 0x13)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_1002886B8[a3];
  }

  return v3;
}

- (int)StringAsUlDcchMsg:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"lte_rrc_csfbParametersRequestCDMA2000"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"lte_rrc_measurementReport"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReconfigurationComplete"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReestablishmentComplete"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionSetupComplete"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"lte_rrc_securityModeComplete"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"lte_rrc_securityModeFailure"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ueCapabilityInformation"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ulHandoverPreparationTransfer"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ulInformationTransfer"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"lte_rrc_counterCheckResponse"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ueInformationResponse_r9"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"lte_rrc_proximityIndication_r9"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rnReconfigurationComplete_r10"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"lte_rrc_mbmsCountingResponse_r10"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"lte_rrc_interFreqRSTDMeasurementIndication_r10"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ueAssistanceInformation_r11"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"lte_rrc_inDeviceCoexIndication_r11"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"lte_rrc_mbmsInterestIndication_r11"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)dlCcchMsg
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_dlCcchMsg;
  }
  else {
    return 0;
  }
}

- (void)setDlCcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlCcchMsg = a3;
}

- (void)setHasDlCcchMsg:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlCcchMsg
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)dlCcchMsgAsString:(int)a3
{
  if (a3 >= 4)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100288750[a3];
  }

  return v3;
}

- (int)StringAsDlCcchMsg:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReestablishment"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReestablishmentReject"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReject"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionSetup"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)dlDcchMsg
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_dlDcchMsg;
  }
  else {
    return 0;
  }
}

- (void)setDlDcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlDcchMsg = a3;
}

- (void)setHasDlDcchMsg:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlDcchMsg
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)dlDcchMsgAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100288770[a3];
  }

  return v3;
}

- (int)StringAsDlDcchMsg:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"lte_rrc_csfbParametersResponseCDMA2000"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"lte_rrc_dlInformationTransfer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"lte_rrc_handoverFromEUTRAPreparationRequest"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"lte_rrc_mobilityFromEUTRACommand"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionReconfiguration"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"lte_rrc_rrcConnectionRelease"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"lte_rrc_securityModeCommand"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ueCapabilityEnquiry"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"lte_rrc_counterCheck"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"lte_rrc_ueInformationRequest_r9"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"lte_rrc_loggedMeasurementConfiguration_r10"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteOtaMsg;
  int v3 = [(CellularLteOtaMsg *)&v7 description];
  int v4 = [(CellularLteOtaMsg *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_phyCellId];
  [v3 setObject:v12 forKey:@"phy_cell_id"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  v13 = +[NSNumber numberWithUnsignedInt:self->_freq];
  [v3 setObject:v13 forKey:@"freq"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  v14 = +[NSNumber numberWithUnsignedInt:self->_rbId];
  [v3 setObject:v14 forKey:@"rb_id"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_48;
  }
LABEL_32:
  unsigned int v15 = self->_channelType - 8;
  if (v15 >= 8)
  {
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_channelType];
  }
  else
  {
    v16 = off_100288678[v15];
  }
  [v3 setObject:v16 forKey:@"channel_type"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_48:
  v28 = +[NSNumber numberWithUnsignedInt:self->_msgType];
  [v3 setObject:v28 forKey:@"msg_type"];

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
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
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_dlBw];
    [v3 setObject:v17 forKey:@"dl_bw"];

    $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v7 & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v18 forKey:@"cell_id"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v19 = +[NSNumber numberWithUnsignedInt:self->_freqBandInd];
  [v3 setObject:v19 forKey:@"freq_band_ind"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v20 = +[NSNumber numberWithUnsignedInt:self->_trackingAreaCode];
  [v3 setObject:v20 forKey:@"tracking_area_code"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  v21 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMcc];
  [v3 setObject:v21 forKey:@"sel_plmn_mcc"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMnc];
  [v3 setObject:v22 forKey:@"sel_plmn_mnc"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
  [v3 setObject:v23 forKey:@"num_mnc_digits"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  v24 = +[NSNumber numberWithBool:self->_upperLayerIndication];
  [v3 setObject:v24 forKey:@"upper_layer_indication"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  v25 = +[NSNumber numberWithBool:self->_scgEverConfigured];
  [v3 setObject:v25 forKey:@"scg_ever_configured"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_43:
  int mcchMsg = self->_mcchMsg;
  if (mcchMsg)
  {
    if (mcchMsg == 1)
    {
      v27 = @"lte_rrc_MBMSCountingRequest_r10";
    }
    else
    {
      v27 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mcchMsg];
    }
  }
  else
  {
    v27 = @"lte_rrc_MBSFNAreaConfiguration_r9";
  }
  [v3 setObject:v27 forKey:@"mcch_msg"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_53:
  int ulCcchMsg = self->_ulCcchMsg;
  if (ulCcchMsg)
  {
    if (ulCcchMsg == 1)
    {
      v30 = @"lte_rrc_rrcConnectionRequest";
    }
    else
    {
      v30 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ulCcchMsg];
    }
  }
  else
  {
    v30 = @"lte_rrc_rrcConnectionReestablishmentRequest";
  }
  [v3 setObject:v30 forKey:@"ul_ccch_msg"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_63;
  }
LABEL_59:
  uint64_t ulDcchMsg = self->_ulDcchMsg;
  if (ulDcchMsg >= 0x13)
  {
    v32 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ulDcchMsg];
  }
  else
  {
    v32 = off_1002886B8[ulDcchMsg];
  }
  [v3 setObject:v32 forKey:@"ul_dcch_msg"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_25;
    }
LABEL_67:
    uint64_t dlDcchMsg = self->_dlDcchMsg;
    if (dlDcchMsg >= 0xB)
    {
      v36 = +[NSString stringWithFormat:@"(unknown: %i)", self->_dlDcchMsg];
    }
    else
    {
      v36 = off_100288770[dlDcchMsg];
    }
    [v3 setObject:v36 forKey:@"dl_dcch_msg"];

    if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_63:
  uint64_t dlCcchMsg = self->_dlCcchMsg;
  if (dlCcchMsg >= 4)
  {
    v34 = +[NSString stringWithFormat:@"(unknown: %i)", self->_dlCcchMsg];
  }
  else
  {
    v34 = off_100288750[dlCcchMsg];
  }
  [v3 setObject:v34 forKey:@"dl_ccch_msg"];

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0) {
    goto LABEL_67;
  }
LABEL_25:
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
LABEL_26:
    v8 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v8 forKey:@"subs_id"];
  }
LABEL_27:
  id v9 = v3;

  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100152EC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_content) {
    PBDataWriterWriteDataField();
  }
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
    if ((*(unsigned char *)&v5 & 2) == 0)
    {
LABEL_14:
      if ((*(unsigned char *)&v5 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&v5 & 2) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v5 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v5 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_26:
  }
    PBDataWriterWriteInt32Field();
LABEL_27:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 21) = self->_subsId;
  *((_DWORD *)v4 + 26) |= 0x10000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 17) = self->_phyCellId;
  *((_DWORD *)v4 + 26) |= 0x1000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 11) = self->_freq;
  *((_DWORD *)v4 + 26) |= 0x40u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 18) = self->_rbId;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 5) = self->_channelType;
  *((_DWORD *)v4 + 26) |= 4u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_36:
  *((_DWORD *)v4 + 15) = self->_msgType;
  *((_DWORD *)v4 + 26) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 13) = self->_length;
    *((_DWORD *)v4 + 26) |= 0x100u;
  }
LABEL_10:
  if (self->_content)
  {
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7 = v4;
    [v4 setContent:];
    int v4 = v7;
  }
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_dlBw;
    *((_DWORD *)v4 + 26) |= 8u;
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_14:
      if ((*(unsigned char *)&v6 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_DWORD *)v4 + 26) |= 2u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 12) = self->_freqBandInd;
  *((_DWORD *)v4 + 26) |= 0x80u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 22) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 19) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 20) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 16) = self->_numMncDigits;
  *((_DWORD *)v4 + 26) |= 0x800u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 101) = self->_upperLayerIndication;
  *((_DWORD *)v4 + 26) |= 0x200000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((unsigned char *)v4 + 100) = self->_scgEverConfigured;
  *((_DWORD *)v4 + 26) |= 0x100000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 14) = self->_mcchMsg;
  *((_DWORD *)v4 + 26) |= 0x200u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 23) = self->_ulCcchMsg;
  *((_DWORD *)v4 + 26) |= 0x40000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 24) = self->_ulDcchMsg;
  *((_DWORD *)v4 + 26) |= 0x80000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_50:
  *((_DWORD *)v4 + 9) = self->_dlCcchMsg;
  *((_DWORD *)v4 + 26) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_26:
    *((_DWORD *)v4 + 10) = self->_dlDcchMsg;
    *((_DWORD *)v4 + 26) |= 0x20u;
  }
LABEL_27:
}

- (id)copyWithZone:(_NSZone *)a3
{
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6 = v5;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 26) |= 1u;
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_subsId;
  *((_DWORD *)v5 + 26) |= 0x10000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 17) = self->_phyCellId;
  *((_DWORD *)v5 + 26) |= 0x1000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 11) = self->_freq;
  *((_DWORD *)v5 + 26) |= 0x40u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 18) = self->_rbId;
  *((_DWORD *)v5 + 26) |= 0x2000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 5) = self->_channelType;
  *((_DWORD *)v5 + 26) |= 4u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_32:
  *((_DWORD *)v5 + 15) = self->_msgType;
  *((_DWORD *)v5 + 26) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 13) = self->_length;
    *((_DWORD *)v5 + 26) |= 0x100u;
  }
LABEL_10:
  id v8 = [(NSData *)self->_content copyWithZone:a3];
  id v9 = (void *)v6[3];
  v6[3] = v8;

  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_dlBw;
    *((_DWORD *)v6 + 26) |= 8u;
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 2) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v10 & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&v10 & 2) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 4) = self->_cellId;
  *((_DWORD *)v6 + 26) |= 2u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v10 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 12) = self->_freqBandInd;
  *((_DWORD *)v6 + 26) |= 0x80u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v10 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v6 + 22) = self->_trackingAreaCode;
  *((_DWORD *)v6 + 26) |= 0x20000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v6 + 19) = self->_selPlmnMcc;
  *((_DWORD *)v6 + 26) |= 0x4000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v6 + 20) = self->_selPlmnMnc;
  *((_DWORD *)v6 + 26) |= 0x8000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v10 & 0x200000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 16) = self->_numMncDigits;
  *((_DWORD *)v6 + 26) |= 0x800u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v6 + 101) = self->_upperLayerIndication;
  *((_DWORD *)v6 + 26) |= 0x200000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v6 + 100) = self->_scgEverConfigured;
  *((_DWORD *)v6 + 26) |= 0x100000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v10 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 14) = self->_mcchMsg;
  *((_DWORD *)v6 + 26) |= 0x200u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 23) = self->_ulCcchMsg;
  *((_DWORD *)v6 + 26) |= 0x40000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v10 & 0x10) == 0) {
      goto LABEL_23;
    }
LABEL_46:
    *((_DWORD *)v6 + 9) = self->_dlCcchMsg;
    *((_DWORD *)v6 + 26) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0) {
      return v6;
    }
    goto LABEL_24;
  }
LABEL_45:
  *((_DWORD *)v6 + 24) = self->_ulDcchMsg;
  *((_DWORD *)v6 + 26) |= 0x80000u;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) != 0) {
    goto LABEL_46;
  }
LABEL_23:
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
LABEL_24:
    *((_DWORD *)v6 + 10) = self->_dlDcchMsg;
    *((_DWORD *)v6 + 26) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_121;
  }
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  int v6 = *((_DWORD *)v4 + 26);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_121;
    }
  }
  else if (v6)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 21)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_phyCellId != *((_DWORD *)v4 + 17)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_freq != *((_DWORD *)v4 + 11)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_rbId != *((_DWORD *)v4 + 18)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_channelType != *((_DWORD *)v4 + 5)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_msgType != *((_DWORD *)v4 + 15)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_length != *((_DWORD *)v4 + 13)) {
      goto LABEL_121;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_121;
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](content, "isEqual:")) {
      goto LABEL_121;
    }
    $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 26);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_dlBw != *((_DWORD *)v4 + 8)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 12)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 22)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 19)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 20)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 16)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0) {
      goto LABEL_121;
    }
    if (self->_upperLayerIndication)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_121;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) != 0)
    {
      if (self->_scgEverConfigured)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_121;
        }
        goto LABEL_96;
      }
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_96;
      }
    }
LABEL_121:
    BOOL v9 = 0;
    goto LABEL_122;
  }
  if ((v8 & 0x100000) != 0) {
    goto LABEL_121;
  }
LABEL_96:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_mcchMsg != *((_DWORD *)v4 + 14)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_ulCcchMsg != *((_DWORD *)v4 + 23)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_ulDcchMsg != *((_DWORD *)v4 + 24)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_dlCcchMsg != *((_DWORD *)v4 + 9)) {
      goto LABEL_121;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_dlDcchMsg != *((_DWORD *)v4 + 10)) {
      goto LABEL_121;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (*((_DWORD *)v4 + 26) & 0x20) == 0;
  }
LABEL_122:

  return v9;
}

- (unint64_t)hash
{
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v28 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_subsId;
      if ((*(_WORD *)&has & 0x1000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v28 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
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
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_rbId;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_channelType;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_msgType;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_length;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
LABEL_18:
  unint64_t v11 = (unint64_t)[(NSData *)self->_content hash];
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
    uint64_t v13 = 2654435761 * self->_dlBw;
    if ((*(unsigned char *)&v12 & 2) != 0)
    {
LABEL_20:
      uint64_t v14 = 2654435761 * self->_cellId;
      if ((*(unsigned char *)&v12 & 0x80) != 0) {
        goto LABEL_21;
      }
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&v12 & 2) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
LABEL_21:
    uint64_t v15 = 2654435761 * self->_freqBandInd;
    if ((*(_DWORD *)&v12 & 0x20000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_22:
    uint64_t v16 = 2654435761 * self->_trackingAreaCode;
    if ((*(_WORD *)&v12 & 0x4000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v16 = 0;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
LABEL_23:
    uint64_t v17 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&v12 & 0x8000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v17 = 0;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
LABEL_24:
    uint64_t v18 = 2654435761 * self->_selPlmnMnc;
    if ((*(_WORD *)&v12 & 0x800) != 0) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_25:
    uint64_t v19 = 2654435761 * self->_numMncDigits;
    if ((*(_DWORD *)&v12 & 0x200000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) != 0)
  {
LABEL_26:
    uint64_t v20 = 2654435761 * self->_upperLayerIndication;
    if ((*(_DWORD *)&v12 & 0x100000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_27:
    uint64_t v21 = 2654435761 * self->_scgEverConfigured;
    if ((*(_WORD *)&v12 & 0x200) != 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_28:
    uint64_t v22 = 2654435761 * self->_mcchMsg;
    if ((*(_DWORD *)&v12 & 0x40000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
LABEL_29:
    uint64_t v23 = 2654435761 * self->_ulCcchMsg;
    if ((*(_DWORD *)&v12 & 0x80000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_30:
    uint64_t v24 = 2654435761 * self->_ulDcchMsg;
    if ((*(unsigned char *)&v12 & 0x10) != 0) {
      goto LABEL_31;
    }
LABEL_45:
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v12 & 0x20) != 0) {
      goto LABEL_32;
    }
LABEL_46:
    uint64_t v26 = 0;
    return v4 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_44:
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v12 & 0x10) == 0) {
    goto LABEL_45;
  }
LABEL_31:
  uint64_t v25 = 2654435761 * self->_dlCcchMsg;
  if ((*(unsigned char *)&v12 & 0x20) == 0) {
    goto LABEL_46;
  }
LABEL_32:
  uint64_t v26 = 2654435761 * self->_dlDcchMsg;
  return v4 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 26);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 26);
    if ((v5 & 0x10000) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_phyCellId = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_freq = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_rbId = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_channelType = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_36:
  self->_msgType = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v4 + 26) & 0x100) != 0)
  {
LABEL_9:
    self->_length = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_10:
  if (*((void *)v4 + 3))
  {
    id v7 = v4;
    -[CellularLteOtaMsg setContent:](self, "setContent:");
    id v4 = v7;
  }
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 8) != 0)
  {
    self->_dlBw = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 8u;
    int v6 = *((_DWORD *)v4 + 26);
    if ((v6 & 2) == 0)
    {
LABEL_14:
      if ((v6 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_40;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_14;
  }
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x80) == 0)
  {
LABEL_15:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_freqBandInd = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_trackingAreaCode = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_selPlmnMcc = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((v6 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_selPlmnMnc = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x800) == 0)
  {
LABEL_19:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_numMncDigits = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x200000) == 0)
  {
LABEL_20:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_upperLayerIndication = *((unsigned char *)v4 + 101);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((v6 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_scgEverConfigured = *((unsigned char *)v4 + 100);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x200) == 0)
  {
LABEL_22:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_int mcchMsg = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x40000) == 0)
  {
LABEL_23:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_int ulCcchMsg = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x80000) == 0)
  {
LABEL_24:
    if ((v6 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_uint64_t ulDcchMsg = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x10) == 0)
  {
LABEL_25:
    if ((v6 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_50:
  self->_uint64_t dlCcchMsg = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v4 + 26) & 0x20) != 0)
  {
LABEL_26:
    self->_uint64_t dlDcchMsg = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_27:
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

- (BOOL)upperLayerIndication
{
  return self->_upperLayerIndication;
}

- (BOOL)scgEverConfigured
{
  return self->_scgEverConfigured;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end