@interface ADAttributionRequest
+ (id)options;
- (BOOL)attributedByiTunes;
- (BOOL)hasAdMetadata;
- (BOOL)hasAnonymousDemandiAdID;
- (BOOL)hasAttributedByiTunes;
- (BOOL)hasBundleID;
- (BOOL)hasDPID;
- (BOOL)hasDownloadClickTimestamp;
- (BOOL)hasDownloadType;
- (BOOL)hasIAdConversionTimestamp;
- (BOOL)hasIAdID;
- (BOOL)hasIAdImpressionTimestamp;
- (BOOL)hasPurchaseTimestamp;
- (BOOL)hasRunState;
- (BOOL)hasSearchAdClickTimestamp;
- (BOOL)hasTiltID;
- (BOOL)hasToroID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)anonymousDemandiAdID;
- (NSData)dPID;
- (NSData)iAdID;
- (NSData)tiltID;
- (NSData)toroID;
- (NSString)adMetadata;
- (NSString)bundleID;
- (double)downloadClickTimestamp;
- (double)iAdConversionTimestamp;
- (double)iAdImpressionTimestamp;
- (double)purchaseTimestamp;
- (double)searchAdClickTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)downloadTypeAsString:(int)a3;
- (id)runStateAsString:(int)a3;
- (int)StringAsDownloadType:(id)a3;
- (int)StringAsRunState:(id)a3;
- (int)downloadType;
- (int)runState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdMetadata:(id)a3;
- (void)setAnonymousDemandiAdID:(id)a3;
- (void)setAttributedByiTunes:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setDPID:(id)a3;
- (void)setDownloadClickTimestamp:(double)a3;
- (void)setDownloadType:(int)a3;
- (void)setHasAttributedByiTunes:(BOOL)a3;
- (void)setHasDownloadClickTimestamp:(BOOL)a3;
- (void)setHasDownloadType:(BOOL)a3;
- (void)setHasIAdConversionTimestamp:(BOOL)a3;
- (void)setHasIAdImpressionTimestamp:(BOOL)a3;
- (void)setHasPurchaseTimestamp:(BOOL)a3;
- (void)setHasRunState:(BOOL)a3;
- (void)setHasSearchAdClickTimestamp:(BOOL)a3;
- (void)setIAdConversionTimestamp:(double)a3;
- (void)setIAdID:(id)a3;
- (void)setIAdImpressionTimestamp:(double)a3;
- (void)setPurchaseTimestamp:(double)a3;
- (void)setRunState:(int)a3;
- (void)setSearchAdClickTimestamp:(double)a3;
- (void)setTiltID:(id)a3;
- (void)setToroID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADAttributionRequest

+ (id)options
{
  if (options_once != -1) {
    dispatch_once(&options_once, &__block_literal_global);
  }
  v2 = (void *)options_sOptions;
  return v2;
}

void __31__ADAttributionRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions;
  options_sOptions = (uint64_t)&unk_1F27153E8;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasTiltID
{
  return self->_tiltID != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setPurchaseTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_purchaseTimestamp = a3;
}

- (void)setHasPurchaseTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPurchaseTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIAdConversionTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_iAdConversionTimestamp = a3;
}

- (void)setHasIAdConversionTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIAdConversionTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIAdImpressionTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_iAdImpressionTimestamp = a3;
}

- (void)setHasIAdImpressionTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIAdImpressionTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAttributedByiTunes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_attributedByiTunes = a3;
}

- (void)setHasAttributedByiTunes:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasAttributedByiTunes
{
  return *(unsigned char *)&self->_has >> 7;
}

- (int)runState
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_runState;
  }
  else {
    return 0;
  }
}

- (void)setRunState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRunState
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68A0720[a3];
  }
  return v3;
}

- (int)StringAsRunState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Simulator"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DevelopmentDevice"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConsumerDevice"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasToroID
{
  return self->_toroID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (void)setSearchAdClickTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_searchAdClickTimestamp = a3;
}

- (void)setHasSearchAdClickTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSearchAdClickTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasAdMetadata
{
  return self->_adMetadata != 0;
}

- (void)setDownloadClickTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_downloadClickTimestamp = a3;
}

- (void)setHasDownloadClickTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDownloadClickTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)downloadType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_downloadType;
  }
  else {
    return 0;
  }
}

- (void)setDownloadType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_downloadType = a3;
}

- (void)setHasDownloadType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDownloadType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)downloadTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68A0738[a3];
  }
  return v3;
}

- (int)StringAsDownloadType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoDownload"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Download"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Redownload"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADAttributionRequest;
  int v4 = [(ADAttributionRequest *)&v8 description];
  v5 = [(ADAttributionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  tiltID = self->_tiltID;
  if (tiltID) {
    [v4 setObject:tiltID forKey:@"tiltID"];
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID) {
    [v4 setObject:anonymousDemandiAdID forKey:@"anonymousDemandiAdID"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_purchaseTimestamp];
    [v4 setObject:v10 forKey:@"purchaseTimestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v11 = [NSNumber numberWithDouble:self->_iAdConversionTimestamp];
  [v4 setObject:v11 forKey:@"iAdConversionTimestamp"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = [NSNumber numberWithDouble:self->_iAdImpressionTimestamp];
  [v4 setObject:v12 forKey:@"iAdImpressionTimestamp"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithBool:self->_attributedByiTunes];
  [v4 setObject:v13 forKey:@"attributedByiTunes"];

  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t runState = self->_runState;
  if (runState >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_runState);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E68A0720[runState];
  }
  [v4 setObject:v15 forKey:@"runState"];

LABEL_23:
  toroID = self->_toroID;
  if (toroID) {
    [v4 setObject:toroID forKey:@"toroID"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v4 setObject:dPID forKey:@"DPID"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v18 = [NSNumber numberWithDouble:self->_searchAdClickTimestamp];
    [v4 setObject:v18 forKey:@"searchAdClickTimestamp"];
  }
  adMetadata = self->_adMetadata;
  if (adMetadata) {
    [v4 setObject:adMetadata forKey:@"adMetadata"];
  }
  char v20 = (char)self->_has;
  if (v20)
  {
    v21 = [NSNumber numberWithDouble:self->_downloadClickTimestamp];
    [v4 setObject:v21 forKey:@"downloadClickTimestamp"];

    char v20 = (char)self->_has;
  }
  if ((v20 & 0x20) != 0)
  {
    uint64_t downloadType = self->_downloadType;
    if (downloadType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_downloadType);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E68A0738[downloadType];
    }
    [v4 setObject:v23 forKey:@"downloadType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADAttributionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_iAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_tiltID)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_anonymousDemandiAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_15:
  if (self->_toroID)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_dPID)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_adMetadata)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    id v4 = v7;
  }
  if (self->_tiltID)
  {
    objc_msgSend(v7, "setTiltID:");
    id v4 = v7;
  }
  if (self->_anonymousDemandiAdID)
  {
    objc_msgSend(v7, "setAnonymousDemandiAdID:");
    id v4 = v7;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v7, "setBundleID:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_purchaseTimestamp;
    *((unsigned char *)v4 + 124) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 2) = *(void *)&self->_iAdConversionTimestamp;
  *((unsigned char *)v4 + 124) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 3) = *(void *)&self->_iAdImpressionTimestamp;
  *((unsigned char *)v4 + 124) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_33:
  *((unsigned char *)v4 + 120) = self->_attributedByiTunes;
  *((unsigned char *)v4 + 124) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 24) = self->_runState;
    *((unsigned char *)v4 + 124) |= 0x40u;
  }
LABEL_15:
  if (self->_toroID)
  {
    objc_msgSend(v7, "setToroID:");
    id v4 = v7;
  }
  if (self->_dPID)
  {
    objc_msgSend(v7, "setDPID:");
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_searchAdClickTimestamp;
    *((unsigned char *)v4 + 124) |= 0x10u;
  }
  if (self->_adMetadata)
  {
    objc_msgSend(v7, "setAdMetadata:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    *((void *)v4 + 1) = *(void *)&self->_downloadClickTimestamp;
    *((unsigned char *)v4 + 124) |= 1u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_downloadType;
    *((unsigned char *)v4 + 124) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_iAdID copyWithZone:a3];
  id v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  uint64_t v8 = [(NSData *)self->_tiltID copyWithZone:a3];
  v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  uint64_t v10 = [(NSData *)self->_anonymousDemandiAdID copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_bundleID copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_purchaseTimestamp;
    *(unsigned char *)(v5 + 124) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_iAdConversionTimestamp;
  *(unsigned char *)(v5 + 124) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v5 + 24) = self->_iAdImpressionTimestamp;
  *(unsigned char *)(v5 + 124) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  *(unsigned char *)(v5 + 120) = self->_attributedByiTunes;
  *(unsigned char *)(v5 + 124) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 96) = self->_runState;
    *(unsigned char *)(v5 + 124) |= 0x40u;
  }
LABEL_7:
  uint64_t v15 = [(NSData *)self->_toroID copyWithZone:a3];
  v16 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v15;

  uint64_t v17 = [(NSData *)self->_dPID copyWithZone:a3];
  v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_searchAdClickTimestamp;
    *(unsigned char *)(v5 + 124) |= 0x10u;
  }
  uint64_t v19 = [(NSString *)self->_adMetadata copyWithZone:a3];
  char v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  char v21 = (char)self->_has;
  if (v21)
  {
    *(double *)(v5 + 8) = self->_downloadClickTimestamp;
    *(unsigned char *)(v5 + 124) |= 1u;
    char v21 = (char)self->_has;
  }
  if ((v21 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_downloadType;
    *(unsigned char *)(v5 + 124) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  tiltID = self->_tiltID;
  if ((unint64_t)tiltID | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](tiltID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 8) == 0 || self->_purchaseTimestamp != *((double *)v4 + 4)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 2) == 0 || self->_iAdConversionTimestamp != *((double *)v4 + 2)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 4) == 0 || self->_iAdImpressionTimestamp != *((double *)v4 + 3)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x80) == 0) {
      goto LABEL_60;
    }
    if (self->_attributedByiTunes)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_60;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x40) == 0 || self->_runState != *((_DWORD *)v4 + 24)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 0x40) != 0)
  {
    goto LABEL_60;
  }
  toroID = self->_toroID;
  if ((unint64_t)toroID | *((void *)v4 + 14) && !-[NSData isEqual:](toroID, "isEqual:")) {
    goto LABEL_60;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x10) == 0 || self->_searchAdClickTimestamp != *((double *)v4 + 5)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 0x10) != 0)
  {
    goto LABEL_60;
  }
  adMetadata = self->_adMetadata;
  if ((unint64_t)adMetadata | *((void *)v4 + 6))
  {
    if (-[NSString isEqual:](adMetadata, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_50;
    }
LABEL_60:
    BOOL v13 = 0;
    goto LABEL_61;
  }
LABEL_50:
  if (has)
  {
    if ((*((unsigned char *)v4 + 124) & 1) == 0 || self->_downloadClickTimestamp != *((double *)v4 + 1)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 124))
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x20) == 0 || self->_downloadType != *((_DWORD *)v4 + 20)) {
      goto LABEL_60;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (*((unsigned char *)v4 + 124) & 0x20) == 0;
  }
LABEL_61:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v42 = [(NSData *)self->_iAdID hash];
  uint64_t v41 = [(NSData *)self->_tiltID hash];
  uint64_t v40 = [(NSData *)self->_anonymousDemandiAdID hash];
  NSUInteger v39 = [(NSString *)self->_bundleID hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double purchaseTimestamp = self->_purchaseTimestamp;
    double v6 = -purchaseTimestamp;
    if (purchaseTimestamp >= 0.0) {
      double v6 = self->_purchaseTimestamp;
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
    double iAdConversionTimestamp = self->_iAdConversionTimestamp;
    double v11 = -iAdConversionTimestamp;
    if (iAdConversionTimestamp >= 0.0) {
      double v11 = self->_iAdConversionTimestamp;
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
  unint64_t v38 = v9;
  if ((has & 4) != 0)
  {
    double iAdImpressionTimestamp = self->_iAdImpressionTimestamp;
    double v16 = -iAdImpressionTimestamp;
    if (iAdImpressionTimestamp >= 0.0) {
      double v16 = self->_iAdImpressionTimestamp;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (has < 0)
  {
    uint64_t v36 = 2654435761 * self->_attributedByiTunes;
    if ((has & 0x40) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((has & 0x40) == 0)
    {
LABEL_27:
      uint64_t v19 = 0;
      goto LABEL_30;
    }
  }
  uint64_t v19 = 2654435761 * self->_runState;
LABEL_30:
  uint64_t v20 = [(NSData *)self->_toroID hash];
  uint64_t v21 = [(NSData *)self->_dPID hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    double searchAdClickTimestamp = self->_searchAdClickTimestamp;
    double v24 = -searchAdClickTimestamp;
    if (searchAdClickTimestamp >= 0.0) {
      double v24 = self->_searchAdClickTimestamp;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_adMetadata hash];
  char v28 = (char)self->_has;
  if (v28)
  {
    double downloadClickTimestamp = self->_downloadClickTimestamp;
    double v31 = -downloadClickTimestamp;
    if (downloadClickTimestamp >= 0.0) {
      double v31 = self->_downloadClickTimestamp;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((v28 & 0x20) != 0) {
    uint64_t v34 = 2654435761 * self->_downloadType;
  }
  else {
    uint64_t v34 = 0;
  }
  return v41 ^ v42 ^ v40 ^ v39 ^ v4 ^ v38 ^ v14 ^ v37 ^ v19 ^ v20 ^ v21 ^ v22 ^ v27 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 11))
  {
    -[ADAttributionRequest setIAdID:](self, "setIAdID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[ADAttributionRequest setTiltID:](self, "setTiltID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[ADAttributionRequest setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[ADAttributionRequest setBundleID:](self, "setBundleID:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 124);
  if ((v5 & 8) != 0)
  {
    self->_double purchaseTimestamp = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 124);
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_double iAdConversionTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 124);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double iAdImpressionTimestamp = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 124);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_33:
  self->_attributedByiTunes = *((unsigned char *)v4 + 120);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v4 + 124) & 0x40) != 0)
  {
LABEL_14:
    self->_uint64_t runState = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_15:
  if (*((void *)v4 + 14))
  {
    -[ADAttributionRequest setToroID:](self, "setToroID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[ADAttributionRequest setDPID:](self, "setDPID:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 124) & 0x10) != 0)
  {
    self->_double searchAdClickTimestamp = *((double *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 6))
  {
    -[ADAttributionRequest setAdMetadata:](self, "setAdMetadata:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 124);
  if (v6)
  {
    self->_double downloadClickTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 124);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_uint64_t downloadType = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSData)tiltID
{
  return self->_tiltID;
}

- (void)setTiltID:(id)a3
{
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (double)purchaseTimestamp
{
  return self->_purchaseTimestamp;
}

- (double)iAdConversionTimestamp
{
  return self->_iAdConversionTimestamp;
}

- (double)iAdImpressionTimestamp
{
  return self->_iAdImpressionTimestamp;
}

- (BOOL)attributedByiTunes
{
  return self->_attributedByiTunes;
}

- (NSData)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (double)searchAdClickTimestamp
{
  return self->_searchAdClickTimestamp;
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
}

- (double)downloadClickTimestamp
{
  return self->_downloadClickTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_tiltID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_adMetadata, 0);
}

@end