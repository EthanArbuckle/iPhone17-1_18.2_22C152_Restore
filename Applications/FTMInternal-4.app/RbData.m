@interface RbData
- (BOOL)dlHcEnabled;
- (BOOL)hasDlCtrlPdus;
- (BOOL)hasDlDataBytes;
- (BOOL)hasDlHcEnabled;
- (BOOL)hasDlHcPdus;
- (BOOL)hasDlLastXSecTotalBytes;
- (BOOL)hasDlLastXSecTotalPdus;
- (BOOL)hasDlTotalPdus;
- (BOOL)hasHcDecFailPdus;
- (BOOL)hasQos;
- (BOOL)hasRb;
- (BOOL)hasRlcMode;
- (BOOL)hasUlDataBytes;
- (BOOL)hasUlDiscardBytes;
- (BOOL)hasUlDiscardPdus;
- (BOOL)hasUlDiscardSduBytes;
- (BOOL)hasUlDiscardSdus;
- (BOOL)hasUlLastXSecDiscardBytes;
- (BOOL)hasUlLastXSecDiscardPdus;
- (BOOL)hasUlLastXSecTotalBytes;
- (BOOL)hasUlLastXSecTotalPdus;
- (BOOL)hasUlTotalPdus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rlcModeAsString:(int)a3;
- (int)StringAsRlcMode:(id)a3;
- (int)rlcMode;
- (unint64_t)hash;
- (unsigned)dlCtrlPdus;
- (unsigned)dlDataBytes;
- (unsigned)dlHcPdus;
- (unsigned)dlLastXSecTotalBytes;
- (unsigned)dlLastXSecTotalPdus;
- (unsigned)dlTotalPdus;
- (unsigned)hcDecFailPdus;
- (unsigned)qos;
- (unsigned)rb;
- (unsigned)ulDataBytes;
- (unsigned)ulDiscardBytes;
- (unsigned)ulDiscardPdus;
- (unsigned)ulDiscardSduBytes;
- (unsigned)ulDiscardSdus;
- (unsigned)ulLastXSecDiscardBytes;
- (unsigned)ulLastXSecDiscardPdus;
- (unsigned)ulLastXSecTotalBytes;
- (unsigned)ulLastXSecTotalPdus;
- (unsigned)ulTotalPdus;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDlCtrlPdus:(unsigned int)a3;
- (void)setDlDataBytes:(unsigned int)a3;
- (void)setDlHcEnabled:(BOOL)a3;
- (void)setDlHcPdus:(unsigned int)a3;
- (void)setDlLastXSecTotalBytes:(unsigned int)a3;
- (void)setDlLastXSecTotalPdus:(unsigned int)a3;
- (void)setDlTotalPdus:(unsigned int)a3;
- (void)setHasDlCtrlPdus:(BOOL)a3;
- (void)setHasDlDataBytes:(BOOL)a3;
- (void)setHasDlHcEnabled:(BOOL)a3;
- (void)setHasDlHcPdus:(BOOL)a3;
- (void)setHasDlLastXSecTotalBytes:(BOOL)a3;
- (void)setHasDlLastXSecTotalPdus:(BOOL)a3;
- (void)setHasDlTotalPdus:(BOOL)a3;
- (void)setHasHcDecFailPdus:(BOOL)a3;
- (void)setHasQos:(BOOL)a3;
- (void)setHasRb:(BOOL)a3;
- (void)setHasRlcMode:(BOOL)a3;
- (void)setHasUlDataBytes:(BOOL)a3;
- (void)setHasUlDiscardBytes:(BOOL)a3;
- (void)setHasUlDiscardPdus:(BOOL)a3;
- (void)setHasUlDiscardSduBytes:(BOOL)a3;
- (void)setHasUlDiscardSdus:(BOOL)a3;
- (void)setHasUlLastXSecDiscardBytes:(BOOL)a3;
- (void)setHasUlLastXSecDiscardPdus:(BOOL)a3;
- (void)setHasUlLastXSecTotalBytes:(BOOL)a3;
- (void)setHasUlLastXSecTotalPdus:(BOOL)a3;
- (void)setHasUlTotalPdus:(BOOL)a3;
- (void)setHcDecFailPdus:(unsigned int)a3;
- (void)setQos:(unsigned int)a3;
- (void)setRb:(unsigned int)a3;
- (void)setRlcMode:(int)a3;
- (void)setUlDataBytes:(unsigned int)a3;
- (void)setUlDiscardBytes:(unsigned int)a3;
- (void)setUlDiscardPdus:(unsigned int)a3;
- (void)setUlDiscardSduBytes:(unsigned int)a3;
- (void)setUlDiscardSdus:(unsigned int)a3;
- (void)setUlLastXSecDiscardBytes:(unsigned int)a3;
- (void)setUlLastXSecDiscardPdus:(unsigned int)a3;
- (void)setUlLastXSecTotalBytes:(unsigned int)a3;
- (void)setUlLastXSecTotalPdus:(unsigned int)a3;
- (void)setUlTotalPdus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RbData

- (void)setQos:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_qos = a3;
}

- (void)setHasQos:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasQos
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRb:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rb = a3;
}

- (void)setHasRb:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRb
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setUlDataBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_ulDataBytes = a3;
}

- (void)setHasUlDataBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasUlDataBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDlDataBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dlDataBytes = a3;
}

- (void)setHasDlDataBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDlDataBytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUlDiscardSduBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_ulDiscardSduBytes = a3;
}

- (void)setHasUlDiscardSduBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasUlDiscardSduBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setUlDiscardBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_ulDiscardBytes = a3;
}

- (void)setHasUlDiscardBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasUlDiscardBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDlCtrlPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_dlCtrlPdus = a3;
}

- (void)setHasDlCtrlPdus:(BOOL)a3
{
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDlCtrlPdus
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDlTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlTotalPdus = a3;
}

- (void)setHasDlTotalPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlTotalPdus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDlHcPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlHcPdus = a3;
}

- (void)setHasDlHcPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlHcPdus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHcDecFailPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hcDecFailPdus = a3;
}

- (void)setHasHcDecFailPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHcDecFailPdus
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setUlLastXSecTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulLastXSecTotalPdus = a3;
}

- (void)setHasUlLastXSecTotalPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlLastXSecTotalPdus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUlLastXSecTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_ulLastXSecTotalBytes = a3;
}

- (void)setHasUlLastXSecTotalBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUlLastXSecTotalBytes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setUlLastXSecDiscardBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_ulLastXSecDiscardBytes = a3;
}

- (void)setHasUlLastXSecDiscardBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasUlLastXSecDiscardBytes
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setUlLastXSecDiscardPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_ulLastXSecDiscardPdus = a3;
}

- (void)setHasUlLastXSecDiscardPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUlLastXSecDiscardPdus
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setDlHcEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_dlHcEnabled = a3;
}

- (void)setHasDlHcEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasDlHcEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)rlcMode
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_rlcMode;
  }
  else {
    return 1;
  }
}

- (void)setRlcMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rlcMode = a3;
}

- (void)setHasRlcMode:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRlcMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)rlcModeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"AM";
  }
  else if (a3 == 2)
  {
    v4 = @"UM";
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsRlcMode:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"AM"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"UM"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (void)setUlDiscardSdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_ulDiscardSdus = a3;
}

- (void)setHasUlDiscardSdus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUlDiscardSdus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setUlDiscardPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_ulDiscardPdus = a3;
}

- (void)setHasUlDiscardPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasUlDiscardPdus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setUlTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_ulTotalPdus = a3;
}

- (void)setHasUlTotalPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUlTotalPdus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDlLastXSecTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlLastXSecTotalPdus = a3;
}

- (void)setHasDlLastXSecTotalPdus:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlLastXSecTotalPdus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDlLastXSecTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlLastXSecTotalBytes = a3;
}

- (void)setHasDlLastXSecTotalBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlLastXSecTotalBytes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RbData;
  int v3 = [(RbData *)&v7 description];
  int v4 = [(RbData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_qos];
    [v3 setObject:v7 forKey:@"qos"];

    $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_rb];
  [v3 setObject:v8 forKey:@"rb"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v9 = +[NSNumber numberWithUnsignedInt:self->_ulDataBytes];
  [v3 setObject:v9 forKey:@"ul_data_bytes"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v10 = +[NSNumber numberWithUnsignedInt:self->_dlDataBytes];
  [v3 setObject:v10 forKey:@"dl_data_bytes"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v11 = +[NSNumber numberWithUnsignedInt:self->_ulDiscardSduBytes];
  [v3 setObject:v11 forKey:@"ul_discard_sdu_bytes"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v12 = +[NSNumber numberWithUnsignedInt:self->_ulDiscardBytes];
  [v3 setObject:v12 forKey:@"ul_discard_bytes"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v13 = +[NSNumber numberWithUnsignedInt:self->_dlCtrlPdus];
  [v3 setObject:v13 forKey:@"dl_ctrl_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v14 = +[NSNumber numberWithUnsignedInt:self->_dlTotalPdus];
  [v3 setObject:v14 forKey:@"dl_total_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  v15 = +[NSNumber numberWithUnsignedInt:self->_dlHcPdus];
  [v3 setObject:v15 forKey:@"dl_hc_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  v16 = +[NSNumber numberWithUnsignedInt:self->_hcDecFailPdus];
  [v3 setObject:v16 forKey:@"hc_dec_fail_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  v17 = +[NSNumber numberWithUnsignedInt:self->_ulLastXSecTotalPdus];
  [v3 setObject:v17 forKey:@"ul_last_x_sec_total_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  v18 = +[NSNumber numberWithUnsignedInt:self->_ulLastXSecTotalBytes];
  [v3 setObject:v18 forKey:@"ul_last_x_sec_total_bytes"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  v19 = +[NSNumber numberWithUnsignedInt:self->_ulLastXSecDiscardBytes];
  [v3 setObject:v19 forKey:@"ul_last_x_sec_discard_bytes"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  v20 = +[NSNumber numberWithUnsignedInt:self->_ulLastXSecDiscardPdus];
  [v3 setObject:v20 forKey:@"ul_last_x_sec_discard_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  v21 = +[NSNumber numberWithBool:self->_dlHcEnabled];
  [v3 setObject:v21 forKey:@"dl_hc_enabled"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_41:
  int rlcMode = self->_rlcMode;
  if (rlcMode == 1)
  {
    v23 = @"AM";
  }
  else if (rlcMode == 2)
  {
    v23 = @"UM";
  }
  else
  {
    v23 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rlcMode];
  }
  [v3 setObject:v23 forKey:@"rlc_mode"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  v24 = +[NSNumber numberWithUnsignedInt:self->_ulDiscardSdus];
  [v3 setObject:v24 forKey:@"ul_discard_sdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  v25 = +[NSNumber numberWithUnsignedInt:self->_ulDiscardPdus];
  [v3 setObject:v25 forKey:@"ul_discard_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  v26 = +[NSNumber numberWithUnsignedInt:self->_ulTotalPdus];
  [v3 setObject:v26 forKey:@"ul_total_pdus"];

  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_50:
  v27 = +[NSNumber numberWithUnsignedInt:self->_dlLastXSecTotalPdus];
  [v3 setObject:v27 forKey:@"dl_last_x_sec_total_pdus"];

  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    v5 = +[NSNumber numberWithUnsignedInt:self->_dlLastXSecTotalBytes];
    [v3 setObject:v5 forKey:@"dl_last_x_sec_total_bytes"];
  }
LABEL_23:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003EB6C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 8) != 0) {
LABEL_22:
  }
    PBDataWriterWriteUint32Field();
LABEL_23:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v4[9] = self->_qos;
    v4[23] |= 0x80u;
    $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_rb;
  v4[23] |= 0x100u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[12] = self->_ulDataBytes;
  v4[23] |= 0x400u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[3] = self->_dlDataBytes;
  v4[23] |= 2u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[15] = self->_ulDiscardSduBytes;
  v4[23] |= 0x2000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[13] = self->_ulDiscardBytes;
  v4[23] |= 0x800u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[2] = self->_dlCtrlPdus;
  v4[23] |= 1u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[7] = self->_dlTotalPdus;
  v4[23] |= 0x20u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[4] = self->_dlHcPdus;
  v4[23] |= 4u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[8] = self->_hcDecFailPdus;
  v4[23] |= 0x40u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[20] = self->_ulLastXSecTotalPdus;
  v4[23] |= 0x40000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[19] = self->_ulLastXSecTotalBytes;
  v4[23] |= 0x20000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[17] = self->_ulLastXSecDiscardBytes;
  v4[23] |= 0x8000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[18] = self->_ulLastXSecDiscardPdus;
  v4[23] |= 0x10000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v4 + 88) = self->_dlHcEnabled;
  v4[23] |= 0x100000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  v4[11] = self->_rlcMode;
  v4[23] |= 0x200u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  v4[16] = self->_ulDiscardSdus;
  v4[23] |= 0x4000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  v4[14] = self->_ulDiscardPdus;
  v4[23] |= 0x1000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  v4[21] = self->_ulTotalPdus;
  v4[23] |= 0x80000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  v4[6] = self->_dlLastXSecTotalPdus;
  v4[23] |= 0x10u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    v4[5] = self->_dlLastXSecTotalBytes;
    v4[23] |= 8u;
  }
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((_DWORD *)result + 9) = self->_qos;
    *((_DWORD *)result + 23) |= 0x80u;
    $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_rb;
  *((_DWORD *)result + 23) |= 0x100u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = self->_ulDataBytes;
  *((_DWORD *)result + 23) |= 0x400u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 3) = self->_dlDataBytes;
  *((_DWORD *)result + 23) |= 2u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 15) = self->_ulDiscardSduBytes;
  *((_DWORD *)result + 23) |= 0x2000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 13) = self->_ulDiscardBytes;
  *((_DWORD *)result + 23) |= 0x800u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 2) = self->_dlCtrlPdus;
  *((_DWORD *)result + 23) |= 1u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 7) = self->_dlTotalPdus;
  *((_DWORD *)result + 23) |= 0x20u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 4) = self->_dlHcPdus;
  *((_DWORD *)result + 23) |= 4u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 8) = self->_hcDecFailPdus;
  *((_DWORD *)result + 23) |= 0x40u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 20) = self->_ulLastXSecTotalPdus;
  *((_DWORD *)result + 23) |= 0x40000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 19) = self->_ulLastXSecTotalBytes;
  *((_DWORD *)result + 23) |= 0x20000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 17) = self->_ulLastXSecDiscardBytes;
  *((_DWORD *)result + 23) |= 0x8000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 18) = self->_ulLastXSecDiscardPdus;
  *((_DWORD *)result + 23) |= 0x10000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)result + 88) = self->_dlHcEnabled;
  *((_DWORD *)result + 23) |= 0x100000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 11) = self->_rlcMode;
  *((_DWORD *)result + 23) |= 0x200u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 16) = self->_ulDiscardSdus;
  *((_DWORD *)result + 23) |= 0x4000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 14) = self->_ulDiscardPdus;
  *((_DWORD *)result + 23) |= 0x1000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 21) = self->_ulTotalPdus;
  *((_DWORD *)result + 23) |= 0x80000u;
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 8) == 0) {
      return result;
    }
    goto LABEL_22;
  }
LABEL_43:
  *((_DWORD *)result + 6) = self->_dlLastXSecTotalPdus;
  *((_DWORD *)result + 23) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_22:
  *((_DWORD *)result + 5) = self->_dlLastXSecTotalBytes;
  *((_DWORD *)result + 23) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_110;
  }
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  int v6 = *((_DWORD *)v4 + 23);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_qos != *((_DWORD *)v4 + 9)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_rb != *((_DWORD *)v4 + 10)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_ulDataBytes != *((_DWORD *)v4 + 12)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dlDataBytes != *((_DWORD *)v4 + 3)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_ulDiscardSduBytes != *((_DWORD *)v4 + 15)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_ulDiscardBytes != *((_DWORD *)v4 + 13)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_110;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_dlCtrlPdus != *((_DWORD *)v4 + 2)) {
      goto LABEL_110;
    }
  }
  else if (v6)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dlTotalPdus != *((_DWORD *)v4 + 7)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dlHcPdus != *((_DWORD *)v4 + 4)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_hcDecFailPdus != *((_DWORD *)v4 + 8)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_ulLastXSecTotalPdus != *((_DWORD *)v4 + 20)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_ulLastXSecTotalBytes != *((_DWORD *)v4 + 19)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_ulLastXSecDiscardBytes != *((_DWORD *)v4 + 17)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_ulLastXSecDiscardPdus != *((_DWORD *)v4 + 18)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) != 0)
    {
      if (self->_dlHcEnabled)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_110;
        }
        goto LABEL_80;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_80;
      }
    }
LABEL_110:
    BOOL v7 = 0;
    goto LABEL_111;
  }
  if ((v6 & 0x100000) != 0) {
    goto LABEL_110;
  }
LABEL_80:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_rlcMode != *((_DWORD *)v4 + 11)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_ulDiscardSdus != *((_DWORD *)v4 + 16)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_ulDiscardPdus != *((_DWORD *)v4 + 14)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_ulTotalPdus != *((_DWORD *)v4 + 21)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dlLastXSecTotalPdus != *((_DWORD *)v4 + 6)) {
      goto LABEL_110;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dlLastXSecTotalBytes != *((_DWORD *)v4 + 5)) {
      goto LABEL_110;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 23) & 8) == 0;
  }
LABEL_111:

  return v7;
}

- (unint64_t)hash
{
  $25FB206A76DD1BFE56952B17F1432168 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    uint64_t v3 = 2654435761 * self->_qos;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rb;
      if ((*(_WORD *)&has & 0x400) != 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_ulDataBytes;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_dlDataBytes;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_ulDiscardSduBytes;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_ulDiscardBytes;
    if (*(unsigned char *)&has) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v8 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_dlCtrlPdus;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_dlTotalPdus;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_dlHcPdus;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_hcDecFailPdus;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_ulLastXSecTotalPdus;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_ulLastXSecTotalBytes;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_ulLastXSecDiscardBytes;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_ulLastXSecDiscardPdus;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_dlHcEnabled;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_rlcMode;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_ulDiscardSdus;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_19:
    uint64_t v20 = 2654435761 * self->_ulDiscardPdus;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_ulTotalPdus;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_21;
    }
LABEL_42:
    uint64_t v22 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_22;
    }
LABEL_43:
    uint64_t v23 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_41:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_42;
  }
LABEL_21:
  uint64_t v22 = 2654435761 * self->_dlLastXSecTotalPdus;
  if ((*(unsigned char *)&has & 8) == 0) {
    goto LABEL_43;
  }
LABEL_22:
  uint64_t v23 = 2654435761 * self->_dlLastXSecTotalBytes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x80) != 0)
  {
    self->_qos = *((_DWORD *)v4 + 9);
    *(_DWORD *)&self->_has |= 0x80u;
    int v5 = *((_DWORD *)v4 + 23);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_rb = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_ulDataBytes = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_dlDataBytes = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_ulDiscardSduBytes = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_ulDiscardBytes = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_dlCtrlPdus = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_dlTotalPdus = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_dlHcPdus = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_hcDecFailPdus = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x40000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_ulLastXSecTotalPdus = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x20000) == 0)
  {
LABEL_13:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_ulLastXSecTotalBytes = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x8000) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_ulLastXSecDiscardBytes = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_ulLastXSecDiscardPdus = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x100000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_dlHcEnabled = *((unsigned char *)v4 + 88);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_int rlcMode = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x4000) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_ulDiscardSdus = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x1000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_ulDiscardPdus = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x80000) == 0)
  {
LABEL_20:
    if ((v5 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_ulTotalPdus = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x10) == 0)
  {
LABEL_21:
    if ((v5 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  self->_dlLastXSecTotalPdus = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v4 + 23) & 8) != 0)
  {
LABEL_22:
    self->_dlLastXSecTotalBytes = *((_DWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_23:
}

- (unsigned)qos
{
  return self->_qos;
}

- (unsigned)rb
{
  return self->_rb;
}

- (unsigned)ulDataBytes
{
  return self->_ulDataBytes;
}

- (unsigned)dlDataBytes
{
  return self->_dlDataBytes;
}

- (unsigned)ulDiscardSduBytes
{
  return self->_ulDiscardSduBytes;
}

- (unsigned)ulDiscardBytes
{
  return self->_ulDiscardBytes;
}

- (unsigned)dlCtrlPdus
{
  return self->_dlCtrlPdus;
}

- (unsigned)dlTotalPdus
{
  return self->_dlTotalPdus;
}

- (unsigned)dlHcPdus
{
  return self->_dlHcPdus;
}

- (unsigned)hcDecFailPdus
{
  return self->_hcDecFailPdus;
}

- (unsigned)ulLastXSecTotalPdus
{
  return self->_ulLastXSecTotalPdus;
}

- (unsigned)ulLastXSecTotalBytes
{
  return self->_ulLastXSecTotalBytes;
}

- (unsigned)ulLastXSecDiscardBytes
{
  return self->_ulLastXSecDiscardBytes;
}

- (unsigned)ulLastXSecDiscardPdus
{
  return self->_ulLastXSecDiscardPdus;
}

- (BOOL)dlHcEnabled
{
  return self->_dlHcEnabled;
}

- (unsigned)ulDiscardSdus
{
  return self->_ulDiscardSdus;
}

- (unsigned)ulDiscardPdus
{
  return self->_ulDiscardPdus;
}

- (unsigned)ulTotalPdus
{
  return self->_ulTotalPdus;
}

- (unsigned)dlLastXSecTotalPdus
{
  return self->_dlLastXSecTotalPdus;
}

- (unsigned)dlLastXSecTotalBytes
{
  return self->_dlLastXSecTotalBytes;
}

@end