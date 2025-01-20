@interface BRFieldContentSignature
+ (unint64_t)localEditCounterFromVersionIdentifier:(id)a3;
- (BOOL)containsLocalEdits;
- (BOOL)contentDiffersWithSignature:(id)a3;
- (BOOL)hasContentSignature;
- (BOOL)hasOldVersionIdentifier;
- (BOOL)hasOnlyLocalEditsOnTopOfSignature:(id)a3;
- (BOOL)hasPopulatedVersionAndSignature;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToSignature:(id)a3;
- (BOOL)isPendingSignature;
- (BOOL)readFrom:(id)a3;
- (NSData)contentSignature;
- (NSString)description;
- (NSString)oldVersionIdentifier;
- (NSString)versionIdentifier;
- (id)_oldVersionEtag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)etag;
- (int64_t)size;
- (unint64_t)_localEditCounter;
- (unint64_t)_oldVersionLocalEditCounter;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentSignature:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setOldVersionIdentifier:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setVersionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldContentSignature

- (BOOL)hasContentSignature
{
  return self->_contentSignature != 0;
}

- (BOOL)hasOldVersionIdentifier
{
  return self->_oldVersionIdentifier != 0;
}

- (void)setSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier) {
    [v3 setObject:versionIdentifier forKey:@"versionIdentifier"];
  }
  contentSignature = self->_contentSignature;
  if (contentSignature) {
    [v4 setObject:contentSignature forKey:@"contentSignature"];
  }
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if (oldVersionIdentifier) {
    [v4 setObject:oldVersionIdentifier forKey:@"oldVersionIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithLongLong:self->_size];
    [v4 setObject:v8 forKey:@"size"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldContentSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_versionIdentifier) {
    sub_10002BB30();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_contentSignature) {
    PBDataWriterWriteDataField();
  }
  if (self->_oldVersionIdentifier) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setVersionIdentifier:self->_versionIdentifier];
  if (self->_contentSignature) {
    objc_msgSend(v4, "setContentSignature:");
  }
  if (self->_oldVersionIdentifier) {
    objc_msgSend(v4, "setOldVersionIdentifier:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_size;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_versionIdentifier copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSData *)self->_contentSignature copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_oldVersionIdentifier copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_size;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  versionIdentifier = self->_versionIdentifier;
  if ((unint64_t)versionIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](versionIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  contentSignature = self->_contentSignature;
  if ((unint64_t)contentSignature | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](contentSignature, "isEqual:")) {
      goto LABEL_12;
    }
  }
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if ((unint64_t)oldVersionIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](oldVersionIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_size == *((void *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_versionIdentifier hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_contentSignature hash];
  NSUInteger v5 = [(NSString *)self->_oldVersionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_size;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int64_t *)a3;
  NSUInteger v5 = v4;
  if (v4[4])
  {
    -[BRFieldContentSignature setVersionIdentifier:](self, "setVersionIdentifier:");
    unint64_t v4 = v5;
  }
  if (v4[2])
  {
    -[BRFieldContentSignature setContentSignature:](self, "setContentSignature:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    -[BRFieldContentSignature setOldVersionIdentifier:](self, "setOldVersionIdentifier:");
    unint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_size = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (NSData)contentSignature
{
  return self->_contentSignature;
}

- (void)setContentSignature:(id)a3
{
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (void)setOldVersionIdentifier:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);

  objc_storeStrong((id *)&self->_contentSignature, 0);
}

- (BOOL)contentDiffersWithSignature:(id)a3
{
  id v4 = a3;
  if ([(BRFieldContentSignature *)self isEquivalentToSignature:v4])
  {
    char v5 = 0;
  }
  else if ([(BRFieldContentSignature *)self hasContentSignature] {
         && [v4 hasContentSignature])
  }
  {
    uint64_t v6 = [(BRFieldContentSignature *)self contentSignature];
    v7 = [v4 contentSignature];
    unsigned __int8 v8 = [v6 isEqualToData:v7];

    char v5 = v8 ^ 1;
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)hasOnlyLocalEditsOnTopOfSignature:(id)a3
{
  id v6 = a3;
  v7 = [(BRFieldContentSignature *)self etag];
  unsigned __int8 v8 = [v6 etag];
  if (v7 == v8
    || ([(BRFieldContentSignature *)self etag],
        NSUInteger v3 = objc_claimAutoreleasedReturnValue(),
        [v6 etag],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 isEqualToString:v4]))
  {
    unint64_t v9 = [(BRFieldContentSignature *)self _localEditCounter];
    id v10 = [v6 _localEditCounter];
    if (v7 == v8)
    {
    }
    else
    {
    }
    if (v9 > (unint64_t)v10)
    {
      BOOL v11 = 1;
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ([(BRFieldContentSignature *)self hasOldVersionIdentifier])
  {
    v12 = [(BRFieldContentSignature *)self _oldVersionEtag];
    v13 = [v6 etag];
    if (v12 == v13
      || ([(BRFieldContentSignature *)self _oldVersionEtag],
          NSUInteger v3 = objc_claimAutoreleasedReturnValue(),
          [v6 etag],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      unint64_t v14 = [(BRFieldContentSignature *)self _oldVersionLocalEditCounter];
      BOOL v11 = v14 > (unint64_t)[v6 _localEditCounter];
      if (v12 == v13)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      BOOL v11 = 0;
    }

    goto LABEL_16;
  }
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

+ (unint64_t)localEditCounterFromVersionIdentifier:(id)a3
{
  NSUInteger v3 = [a3 componentsSeparatedByString:@";"];
  if ((unint64_t)[v3 count] >= 2)
  {
    char v5 = [v3 objectAtIndex:1];
    id v4 = [v5 longLongValue];
  }
  else
  {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (BOOL)containsLocalEdits
{
  return [(BRFieldContentSignature *)self _localEditCounter] != 0;
}

- (unint64_t)_localEditCounter
{
  NSUInteger v3 = objc_opt_class();
  versionIdentifier = self->_versionIdentifier;

  return (unint64_t)[v3 localEditCounterFromVersionIdentifier:versionIdentifier];
}

- (unint64_t)_oldVersionLocalEditCounter
{
  NSUInteger v3 = objc_opt_class();
  oldVersionIdentifier = self->_oldVersionIdentifier;

  return (unint64_t)[v3 localEditCounterFromVersionIdentifier:oldVersionIdentifier];
}

- (id)etag
{
  return sub_1000197B8(self->_versionIdentifier);
}

- (id)_oldVersionEtag
{
  return sub_1000197B8(self->_oldVersionIdentifier);
}

- (BOOL)isPendingSignature
{
  if ([(NSString *)self->_versionIdentifier length])
  {
    NSUInteger v3 = [(BRFieldContentSignature *)self etag];
    if (v3 || [(BRFieldContentSignature *)self hasOldVersionIdentifier]) {
      LOBYTE(v4) = 0;
    }
    else {
      unsigned int v4 = ![(BRFieldContentSignature *)self hasContentSignature];
    }
  }
  else if ([(BRFieldContentSignature *)self hasOldVersionIdentifier])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    return ![(BRFieldContentSignature *)self hasContentSignature];
  }
  return v4;
}

- (BOOL)hasPopulatedVersionAndSignature
{
  if ([(NSString *)self->_versionIdentifier length]
    || (BOOL v3 = [(BRFieldContentSignature *)self hasOldVersionIdentifier]))
  {
    LOBYTE(v3) = [(BRFieldContentSignature *)self hasContentSignature];
  }
  return v3;
}

- (BOOL)isEquivalentToSignature:(id)a3
{
  id v4 = a3;
  if (!sub_100019AE4(self, v4)) {
    goto LABEL_12;
  }
  if (![(BRFieldContentSignature *)self hasContentSignature]
    || ![v4 hasContentSignature])
  {
    goto LABEL_7;
  }
  char v5 = [(BRFieldContentSignature *)self contentSignature];
  if ((objc_msgSend(v5, "brc_signatureIsPackage") & 1) == 0) {
    goto LABEL_11;
  }
  id v6 = [v4 contentSignature];
  unsigned int v7 = objc_msgSend(v6, "brc_signatureIsPackage");

  if (!v7)
  {
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  unsigned __int8 v8 = [(BRFieldContentSignature *)self contentSignature];
  unint64_t v9 = [v4 contentSignature];
  unsigned __int8 v10 = [v8 isEqualToData:v9];

  if ((v10 & 1) == 0)
  {
    char v5 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v14 = 138412802;
      v15 = self;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Signatures are equivalent but content is different %@ vs %@%@", (uint8_t *)&v14, 0x20u);
    }

LABEL_11:
    goto LABEL_12;
  }
LABEL_7:
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<ct %@|%@ sz:%llu sig:%@>", self->_versionIdentifier, self->_oldVersionIdentifier, [(BRFieldContentSignature *)self size], self->_contentSignature];
}

@end