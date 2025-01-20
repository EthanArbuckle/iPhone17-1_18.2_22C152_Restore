@interface PerDrbConfig
- (BOOL)dlCipheringEnabled;
- (BOOL)dlIntegrityEnabled;
- (BOOL)dlRohcEnabled;
- (BOOL)hasDlCipheringEnabled;
- (BOOL)hasDlIntegrityEnabled;
- (BOOL)hasDlRlcPath;
- (BOOL)hasDlRohcEnabled;
- (BOOL)hasDrbId;
- (BOOL)hasUlCipheringEnabled;
- (BOOL)hasUlDataSplitThreshold;
- (BOOL)hasUlIntegrityEnabled;
- (BOOL)hasUlMoreThanOneRlcPresent;
- (BOOL)hasUlPdcpDuplication;
- (BOOL)hasUlRlcPath;
- (BOOL)hasUlRohcEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)ulCipheringEnabled;
- (BOOL)ulIntegrityEnabled;
- (BOOL)ulMoreThanOneRlcPresent;
- (BOOL)ulPdcpDuplication;
- (BOOL)ulRohcEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dlRlcPathAsString:(int)a3;
- (id)ulRlcPathAsString:(int)a3;
- (int)StringAsDlRlcPath:(id)a3;
- (int)StringAsUlRlcPath:(id)a3;
- (int)dlRlcPath;
- (int)ulRlcPath;
- (unint64_t)hash;
- (unsigned)drbId;
- (unsigned)ulDataSplitThreshold;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDlCipheringEnabled:(BOOL)a3;
- (void)setDlIntegrityEnabled:(BOOL)a3;
- (void)setDlRlcPath:(int)a3;
- (void)setDlRohcEnabled:(BOOL)a3;
- (void)setDrbId:(unsigned int)a3;
- (void)setHasDlCipheringEnabled:(BOOL)a3;
- (void)setHasDlIntegrityEnabled:(BOOL)a3;
- (void)setHasDlRlcPath:(BOOL)a3;
- (void)setHasDlRohcEnabled:(BOOL)a3;
- (void)setHasDrbId:(BOOL)a3;
- (void)setHasUlCipheringEnabled:(BOOL)a3;
- (void)setHasUlDataSplitThreshold:(BOOL)a3;
- (void)setHasUlIntegrityEnabled:(BOOL)a3;
- (void)setHasUlMoreThanOneRlcPresent:(BOOL)a3;
- (void)setHasUlPdcpDuplication:(BOOL)a3;
- (void)setHasUlRlcPath:(BOOL)a3;
- (void)setHasUlRohcEnabled:(BOOL)a3;
- (void)setUlCipheringEnabled:(BOOL)a3;
- (void)setUlDataSplitThreshold:(unsigned int)a3;
- (void)setUlIntegrityEnabled:(BOOL)a3;
- (void)setUlMoreThanOneRlcPresent:(BOOL)a3;
- (void)setUlPdcpDuplication:(BOOL)a3;
- (void)setUlRlcPath:(int)a3;
- (void)setUlRohcEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PerDrbConfig

- (void)setDrbId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_drbId = a3;
}

- (void)setHasDrbId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDrbId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)ulRlcPath
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_ulRlcPath;
  }
  else {
    return 0;
  }
}

- (void)setUlRlcPath:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ulRlcPath = a3;
}

- (void)setHasUlRlcPath:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasUlRlcPath
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)ulRlcPathAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100286D38[a3];
  }

  return v3;
}

- (int)StringAsUlRlcPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RB_PATH_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RB_PATH_LTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RB_PATH_NR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RB_PATH_LTE_AND_NR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setUlDataSplitThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ulDataSplitThreshold = a3;
}

- (void)setHasUlDataSplitThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasUlDataSplitThreshold
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setUlPdcpDuplication:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_ulPdcpDuplication = a3;
}

- (void)setHasUlPdcpDuplication:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUlPdcpDuplication
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setUlRohcEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_ulRohcEnabled = a3;
}

- (void)setHasUlRohcEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUlRohcEnabled
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUlIntegrityEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ulIntegrityEnabled = a3;
}

- (void)setHasUlIntegrityEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUlIntegrityEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUlCipheringEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_ulCipheringEnabled = a3;
}

- (void)setHasUlCipheringEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUlCipheringEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUlMoreThanOneRlcPresent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ulMoreThanOneRlcPresent = a3;
}

- (void)setHasUlMoreThanOneRlcPresent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUlMoreThanOneRlcPresent
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)dlRlcPath
{
  if (*(_WORD *)&self->_has) {
    return self->_dlRlcPath;
  }
  else {
    return 0;
  }
}

- (void)setDlRlcPath:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dlRlcPath = a3;
}

- (void)setHasDlRlcPath:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDlRlcPath
{
  return *(_WORD *)&self->_has & 1;
}

- (id)dlRlcPathAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100286D38[a3];
  }

  return v3;
}

- (int)StringAsDlRlcPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RB_PATH_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RB_PATH_LTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RB_PATH_NR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RB_PATH_LTE_AND_NR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDlRohcEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_dlRohcEnabled = a3;
}

- (void)setHasDlRohcEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDlRohcEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDlIntegrityEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dlIntegrityEnabled = a3;
}

- (void)setHasDlIntegrityEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDlIntegrityEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDlCipheringEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dlCipheringEnabled = a3;
}

- (void)setHasDlCipheringEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDlCipheringEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PerDrbConfig;
  __int16 v3 = [(PerDrbConfig *)&v7 description];
  int v4 = [(PerDrbConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_drbId];
    [v3 setObject:v7 forKey:@"drb_id"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t ulRlcPath = self->_ulRlcPath;
  if (ulRlcPath >= 4)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ulRlcPath];
  }
  else
  {
    v9 = off_100286D38[ulRlcPath];
  }
  [v3 setObject:v9 forKey:@"ul_rlc_path"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v10 = +[NSNumber numberWithUnsignedInt:self->_ulDataSplitThreshold];
  [v3 setObject:v10 forKey:@"ul_data_split_threshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v11 = +[NSNumber numberWithBool:self->_ulPdcpDuplication];
  [v3 setObject:v11 forKey:@"ul_pdcp_duplication"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  v12 = +[NSNumber numberWithBool:self->_ulRohcEnabled];
  [v3 setObject:v12 forKey:@"ul_rohc_enabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  v13 = +[NSNumber numberWithBool:self->_ulIntegrityEnabled];
  [v3 setObject:v13 forKey:@"ul_integrity_enabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  v14 = +[NSNumber numberWithBool:self->_ulCipheringEnabled];
  [v3 setObject:v14 forKey:@"ul_ciphering_enabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  v15 = +[NSNumber numberWithBool:self->_ulMoreThanOneRlcPresent];
  [v3 setObject:v15 forKey:@"ul_more_than_one_rlc_present"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_28:
  uint64_t dlRlcPath = self->_dlRlcPath;
  if (dlRlcPath >= 4)
  {
    v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_dlRlcPath];
  }
  else
  {
    v17 = off_100286D38[dlRlcPath];
  }
  [v3 setObject:v17 forKey:@"dl_rlc_path"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = +[NSNumber numberWithBool:self->_dlRohcEnabled];
  [v3 setObject:v18 forKey:@"dl_rohc_enabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  v19 = +[NSNumber numberWithBool:self->_dlIntegrityEnabled];
  [v3 setObject:v19 forKey:@"dl_integrity_enabled"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    v5 = +[NSNumber numberWithBool:self->_dlCipheringEnabled];
    [v3 setObject:v5 forKey:@"dl_ciphering_enabled"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000BBB4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_13:
  }
    PBDataWriterWriteBOOLField();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_drbId;
    *((_WORD *)v4 + 16) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_ulRlcPath;
  *((_WORD *)v4 + 16) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[4] = self->_ulDataSplitThreshold;
  *((_WORD *)v4 + 16) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 30) = self->_ulPdcpDuplication;
  *((_WORD *)v4 + 16) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 31) = self->_ulRohcEnabled;
  *((_WORD *)v4 + 16) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 28) = self->_ulIntegrityEnabled;
  *((_WORD *)v4 + 16) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)v4 + 27) = self->_ulCipheringEnabled;
  *((_WORD *)v4 + 16) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 29) = self->_ulMoreThanOneRlcPresent;
  *((_WORD *)v4 + 16) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[2] = self->_dlRlcPath;
  *((_WORD *)v4 + 16) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)v4 + 26) = self->_dlRohcEnabled;
  *((_WORD *)v4 + 16) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((unsigned char *)v4 + 25) = self->_dlIntegrityEnabled;
  *((_WORD *)v4 + 16) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((unsigned char *)v4 + 24) = self->_dlCipheringEnabled;
    *((_WORD *)v4 + 16) |= 0x10u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_drbId;
    *((_WORD *)result + 16) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_ulRlcPath;
  *((_WORD *)result + 16) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 4) = self->_ulDataSplitThreshold;
  *((_WORD *)result + 16) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 30) = self->_ulPdcpDuplication;
  *((_WORD *)result + 16) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)result + 31) = self->_ulRohcEnabled;
  *((_WORD *)result + 16) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 28) = self->_ulIntegrityEnabled;
  *((_WORD *)result + 16) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)result + 27) = self->_ulCipheringEnabled;
  *((_WORD *)result + 16) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)result + 29) = self->_ulMoreThanOneRlcPresent;
  *((_WORD *)result + 16) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 2) = self->_dlRlcPath;
  *((_WORD *)result + 16) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)result + 26) = self->_dlRohcEnabled;
  *((_WORD *)result + 16) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((unsigned char *)result + 25) = self->_dlIntegrityEnabled;
  *((_WORD *)result + 16) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_13:
  *((unsigned char *)result + 24) = self->_dlCipheringEnabled;
  *((_WORD *)result + 16) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 16);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drbId != *((_DWORD *)v4 + 3)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_ulRlcPath != *((_DWORD *)v4 + 5)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ulDataSplitThreshold != *((_DWORD *)v4 + 4)) {
      goto LABEL_81;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x400) == 0) {
      goto LABEL_81;
    }
    if (self->_ulPdcpDuplication)
    {
      if (!*((unsigned char *)v4 + 30)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 30))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x800) == 0) {
      goto LABEL_81;
    }
    if (self->_ulRohcEnabled)
    {
      if (!*((unsigned char *)v4 + 31)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 31))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x800) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x100) == 0) {
      goto LABEL_81;
    }
    if (self->_ulIntegrityEnabled)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_81;
    }
    if (self->_ulCipheringEnabled)
    {
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 27))
    {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x200) == 0) {
      goto LABEL_81;
    }
    if (self->_ulMoreThanOneRlcPresent)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_dlRlcPath != *((_DWORD *)v4 + 2)) {
      goto LABEL_81;
    }
  }
  else if (v6)
  {
    goto LABEL_81;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_81;
    }
    if (self->_dlRohcEnabled)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_81;
    }
    if (self->_dlIntegrityEnabled)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_dlCipheringEnabled)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_81;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_81;
      }
      BOOL v7 = 1;
      goto LABEL_82;
    }
LABEL_81:
    BOOL v7 = 0;
    goto LABEL_82;
  }
  BOOL v7 = (v6 & 0x10) == 0;
LABEL_82:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_drbId;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_ulRlcPath;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_ulDataSplitThreshold;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_ulPdcpDuplication;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_ulRohcEnabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_ulIntegrityEnabled;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_ulCipheringEnabled;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_ulMoreThanOneRlcPresent;
    if (has) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if (has)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_dlRlcPath;
    if ((has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_dlRohcEnabled;
    if ((has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_dlIntegrityEnabled;
  if ((has & 0x10) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_dlCipheringEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_drbId = *((_DWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 16);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t ulRlcPath = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_ulDataSplitThreshold = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_ulPdcpDuplication = *((unsigned char *)v4 + 30);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_ulRohcEnabled = *((unsigned char *)v4 + 31);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_ulIntegrityEnabled = *((unsigned char *)v4 + 28);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_ulCipheringEnabled = *((unsigned char *)v4 + 27);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_ulMoreThanOneRlcPresent = *((unsigned char *)v4 + 29);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_uint64_t dlRlcPath = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_dlRohcEnabled = *((unsigned char *)v4 + 26);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_dlIntegrityEnabled = *((unsigned char *)v4 + 25);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 16) & 0x10) != 0)
  {
LABEL_13:
    self->_dlCipheringEnabled = *((unsigned char *)v4 + 24);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_14:
}

- (unsigned)drbId
{
  return self->_drbId;
}

- (unsigned)ulDataSplitThreshold
{
  return self->_ulDataSplitThreshold;
}

- (BOOL)ulPdcpDuplication
{
  return self->_ulPdcpDuplication;
}

- (BOOL)ulRohcEnabled
{
  return self->_ulRohcEnabled;
}

- (BOOL)ulIntegrityEnabled
{
  return self->_ulIntegrityEnabled;
}

- (BOOL)ulCipheringEnabled
{
  return self->_ulCipheringEnabled;
}

- (BOOL)ulMoreThanOneRlcPresent
{
  return self->_ulMoreThanOneRlcPresent;
}

- (BOOL)dlRohcEnabled
{
  return self->_dlRohcEnabled;
}

- (BOOL)dlIntegrityEnabled
{
  return self->_dlIntegrityEnabled;
}

- (BOOL)dlCipheringEnabled
{
  return self->_dlCipheringEnabled;
}

@end