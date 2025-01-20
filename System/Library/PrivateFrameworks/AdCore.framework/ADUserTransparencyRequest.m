@interface ADUserTransparencyRequest
+ (id)options;
- (BOOL)hasContentiAdID;
- (BOOL)hasDPID;
- (BOOL)hasIAdID;
- (BOOL)hasITunesStore;
- (BOOL)hasIsSignedInToiTunes;
- (BOOL)hasLimitAdTracking;
- (BOOL)hasLocaleIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignedInToiTunes;
- (BOOL)limitAdTracking;
- (BOOL)readFrom:(id)a3;
- (NSData)contentiAdID;
- (NSData)dPID;
- (NSData)iAdID;
- (NSString)iTunesStore;
- (NSString)localeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentiAdID:(id)a3;
- (void)setDPID:(id)a3;
- (void)setHasIsSignedInToiTunes:(BOOL)a3;
- (void)setHasLimitAdTracking:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setITunesStore:(id)a3;
- (void)setIsSignedInToiTunes:(BOOL)a3;
- (void)setLimitAdTracking:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADUserTransparencyRequest

+ (id)options
{
  if (options_once_12 != -1) {
    dispatch_once(&options_once_12, &__block_literal_global_19);
  }
  v2 = (void *)options_sOptions_12;
  return v2;
}

void __36__ADUserTransparencyRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_12;
  options_sOptions_12 = (uint64_t)&unk_1F2715618;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasITunesStore
{
  return self->_iTunesStore != 0;
}

- (void)setLimitAdTracking:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_limitAdTracking = a3;
}

- (void)setHasLimitAdTracking:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLimitAdTracking
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsSignedInToiTunes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSignedInToiTunes = a3;
}

- (void)setHasIsSignedInToiTunes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSignedInToiTunes
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADUserTransparencyRequest;
  v4 = [(ADUserTransparencyRequest *)&v8 description];
  v5 = [(ADUserTransparencyRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  dPID = self->_dPID;
  if (dPID) {
    [v3 setObject:dPID forKey:@"DPID"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:@"localeIdentifier"];
  }
  iAdID = self->_iAdID;
  if (iAdID) {
    [v4 setObject:iAdID forKey:@"iAdID"];
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID) {
    [v4 setObject:contentiAdID forKey:@"contentiAdID"];
  }
  iTunesStore = self->_iTunesStore;
  if (iTunesStore) {
    [v4 setObject:iTunesStore forKey:@"iTunesStore"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_limitAdTracking];
    [v4 setObject:v11 forKey:@"limitAdTracking"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v12 = [NSNumber numberWithBool:self->_isSignedInToiTunes];
    [v4 setObject:v12 forKey:@"isSignedInToiTunes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADUserTransparencyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_dPID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_iAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_contentiAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_iTunesStore)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_dPID)
  {
    objc_msgSend(v4, "setDPID:");
    id v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v6, "setLocaleIdentifier:");
    id v4 = v6;
  }
  if (self->_iAdID)
  {
    objc_msgSend(v6, "setIAdID:");
    id v4 = v6;
  }
  if (self->_contentiAdID)
  {
    objc_msgSend(v6, "setContentiAdID:");
    id v4 = v6;
  }
  if (self->_iTunesStore)
  {
    objc_msgSend(v6, "setITunesStore:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[49] = self->_limitAdTracking;
    v4[52] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[48] = self->_isSignedInToiTunes;
    v4[52] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_dPID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSData *)self->_iAdID copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_contentiAdID copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  uint64_t v14 = [(NSString *)self->_iTunesStore copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 49) = self->_limitAdTracking;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 48) = self->_isSignedInToiTunes;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:")) {
      goto LABEL_22;
    }
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_22;
    }
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:")) {
      goto LABEL_22;
    }
  }
  iTunesStore = self->_iTunesStore;
  if ((unint64_t)iTunesStore | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](iTunesStore, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_22;
    }
    if (self->_limitAdTracking)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_22;
  }
  BOOL v10 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_isSignedInToiTunes)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_22;
      }
      BOOL v10 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v10 = 0;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_dPID hash];
  NSUInteger v4 = [(NSString *)self->_localeIdentifier hash];
  uint64_t v5 = [(NSData *)self->_iAdID hash];
  uint64_t v6 = [(NSData *)self->_contentiAdID hash];
  NSUInteger v7 = [(NSString *)self->_iTunesStore hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_limitAdTracking;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_isSignedInToiTunes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[ADUserTransparencyRequest setDPID:](self, "setDPID:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[ADUserTransparencyRequest setLocaleIdentifier:](self, "setLocaleIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[ADUserTransparencyRequest setIAdID:](self, "setIAdID:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[ADUserTransparencyRequest setContentiAdID:](self, "setContentiAdID:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[ADUserTransparencyRequest setITunesStore:](self, "setITunesStore:");
    NSUInteger v4 = v6;
  }
  BOOL v5 = v4[52];
  if ((v5 & 2) != 0)
  {
    self->_limitAdTracking = v4[49];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[52];
  }
  if (v5)
  {
    self->_isSignedInToiTunes = v4[48];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
}

- (NSString)iTunesStore
{
  return self->_iTunesStore;
}

- (void)setITunesStore:(id)a3
{
}

- (BOOL)limitAdTracking
{
  return self->_limitAdTracking;
}

- (BOOL)isSignedInToiTunes
{
  return self->_isSignedInToiTunes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStore, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
}

@end