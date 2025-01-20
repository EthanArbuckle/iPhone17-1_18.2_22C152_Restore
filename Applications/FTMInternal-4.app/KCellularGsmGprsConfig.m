@interface KCellularGsmGprsConfig
- (BOOL)extUplTbfSupported;
- (BOOL)gprsSup;
- (BOOL)hasAccThr;
- (BOOL)hasCellBarAccess2;
- (BOOL)hasCrHyst;
- (BOOL)hasExtUplTbfSupported;
- (BOOL)hasGprsSup;
- (BOOL)hasNco;
- (BOOL)hasNom;
- (BOOL)hasPriorityClass;
- (BOOL)hasRac;
- (BOOL)hasSpPgCy;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)spPgCy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)accThr;
- (unsigned)cellBarAccess2;
- (unsigned)crHyst;
- (unsigned)nco;
- (unsigned)nom;
- (unsigned)priorityClass;
- (unsigned)rac;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccThr:(unsigned int)a3;
- (void)setCellBarAccess2:(unsigned int)a3;
- (void)setCrHyst:(unsigned int)a3;
- (void)setExtUplTbfSupported:(BOOL)a3;
- (void)setGprsSup:(BOOL)a3;
- (void)setHasAccThr:(BOOL)a3;
- (void)setHasCellBarAccess2:(BOOL)a3;
- (void)setHasCrHyst:(BOOL)a3;
- (void)setHasExtUplTbfSupported:(BOOL)a3;
- (void)setHasGprsSup:(BOOL)a3;
- (void)setHasNco:(BOOL)a3;
- (void)setHasNom:(BOOL)a3;
- (void)setHasPriorityClass:(BOOL)a3;
- (void)setHasRac:(BOOL)a3;
- (void)setHasSpPgCy:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNco:(unsigned int)a3;
- (void)setNom:(unsigned int)a3;
- (void)setPriorityClass:(unsigned int)a3;
- (void)setRac:(unsigned int)a3;
- (void)setSpPgCy:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularGsmGprsConfig

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

- (void)setGprsSup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_gprsSup = a3;
}

- (void)setHasGprsSup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasGprsSup
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rac = a3;
}

- (void)setHasRac:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRac
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSpPgCy:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_spPgCy = a3;
}

- (void)setHasSpPgCy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSpPgCy
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setNco:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_nco = a3;
}

- (void)setHasNco:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNco
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNom:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_nom = a3;
}

- (void)setHasNom:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNom
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCrHyst:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_crHyst = a3;
}

- (void)setHasCrHyst:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCrHyst
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAccThr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accThr = a3;
}

- (void)setHasAccThr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccThr
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setExtUplTbfSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_extUplTbfSupported = a3;
}

- (void)setHasExtUplTbfSupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasExtUplTbfSupported
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPriorityClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_priorityClass = a3;
}

- (void)setHasPriorityClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPriorityClass
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCellBarAccess2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellBarAccess2 = a3;
}

- (void)setHasCellBarAccess2:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellBarAccess2
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularGsmGprsConfig;
  __int16 v3 = [(KCellularGsmGprsConfig *)&v7 description];
  v4 = [(KCellularGsmGprsConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithBool:self->_gprsSup];
  [v3 setObject:v8 forKey:@"gprs_sup"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v9 = +[NSNumber numberWithUnsignedInt:self->_rac];
  [v3 setObject:v9 forKey:@"rac"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = +[NSNumber numberWithBool:self->_spPgCy];
  [v3 setObject:v10 forKey:@"sp_pg_cy"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = +[NSNumber numberWithUnsignedInt:self->_nco];
  [v3 setObject:v11 forKey:@"nco"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = +[NSNumber numberWithUnsignedInt:self->_nom];
  [v3 setObject:v12 forKey:@"nom"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = +[NSNumber numberWithUnsignedInt:self->_crHyst];
  [v3 setObject:v13 forKey:@"cr_hyst"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = +[NSNumber numberWithUnsignedInt:self->_accThr];
  [v3 setObject:v14 forKey:@"acc_thr"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = +[NSNumber numberWithBool:self->_extUplTbfSupported];
  [v3 setObject:v15 forKey:@"ext_upl_tbf_supported"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = +[NSNumber numberWithUnsignedInt:self->_priorityClass];
  [v3 setObject:v16 forKey:@"priority_class"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  v17 = +[NSNumber numberWithUnsignedInt:self->_cellBarAccess2];
  [v3 setObject:v17 forKey:@"cell_bar_access_2"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A08DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 49) = self->_gprsSup;
  *((_WORD *)v4 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 10) = self->_rac;
  *((_WORD *)v4 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 50) = self->_spPgCy;
  *((_WORD *)v4 + 26) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 7) = self->_nco;
  *((_WORD *)v4 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 8) = self->_nom;
  *((_WORD *)v4 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 6) = self->_crHyst;
  *((_WORD *)v4 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 4) = self->_accThr;
  *((_WORD *)v4 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v4 + 48) = self->_extUplTbfSupported;
  *((_WORD *)v4 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 9) = self->_priorityClass;
  *((_WORD *)v4 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((_DWORD *)v4 + 5) = self->_cellBarAccess2;
  *((_WORD *)v4 + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_WORD *)v4 + 26) |= 0x100u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 49) = self->_gprsSup;
  *((_WORD *)result + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_rac;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 50) = self->_spPgCy;
  *((_WORD *)result + 26) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_nco;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = self->_nom;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_crHyst;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 4) = self->_accThr;
  *((_WORD *)result + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)result + 48) = self->_extUplTbfSupported;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 9) = self->_priorityClass;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 5) = self->_cellBarAccess2;
  *((_WORD *)result + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_13:
  *((_DWORD *)result + 11) = self->_subsId;
  *((_WORD *)result + 26) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 26);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_71;
    }
  }
  else if (v6)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0) {
      goto LABEL_71;
    }
    if (self->_gprsSup)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rac != *((_DWORD *)v4 + 10)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x800) == 0) {
      goto LABEL_71;
    }
    if (self->_spPgCy)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x800) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_nco != *((_DWORD *)v4 + 7)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_nom != *((_DWORD *)v4 + 8)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_crHyst != *((_DWORD *)v4 + 6)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accThr != *((_DWORD *)v4 + 4)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    {
      if (self->_extUplTbfSupported)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_71;
        }
        goto LABEL_56;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_56;
      }
    }
LABEL_71:
    BOOL v7 = 0;
    goto LABEL_72;
  }
  if ((*((_WORD *)v4 + 26) & 0x200) != 0) {
    goto LABEL_71;
  }
LABEL_56:
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_priorityClass != *((_DWORD *)v4 + 9)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cellBarAccess2 != *((_DWORD *)v4 + 5)) {
      goto LABEL_71;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 11)) {
      goto LABEL_71;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100) == 0;
  }
LABEL_72:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_gprsSup;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rac;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_spPgCy;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_nco;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_nom;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_crHyst;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_accThr;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_extUplTbfSupported;
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
    uint64_t v12 = 2654435761 * self->_priorityClass;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((has & 4) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_cellBarAccess2;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 26);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_gprsSup = *((unsigned char *)v4 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_rac = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x800) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_spPgCy = *((unsigned char *)v4 + 50);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_nco = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_nom = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_crHyst = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_accThr = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_extUplTbfSupported = *((unsigned char *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_priorityClass = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_cellBarAccess2 = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
LABEL_13:
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_14:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)gprsSup
{
  return self->_gprsSup;
}

- (unsigned)rac
{
  return self->_rac;
}

- (BOOL)spPgCy
{
  return self->_spPgCy;
}

- (unsigned)nco
{
  return self->_nco;
}

- (unsigned)nom
{
  return self->_nom;
}

- (unsigned)crHyst
{
  return self->_crHyst;
}

- (unsigned)accThr
{
  return self->_accThr;
}

- (BOOL)extUplTbfSupported
{
  return self->_extUplTbfSupported;
}

- (unsigned)priorityClass
{
  return self->_priorityClass;
}

- (unsigned)cellBarAccess2
{
  return self->_cellBarAccess2;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end