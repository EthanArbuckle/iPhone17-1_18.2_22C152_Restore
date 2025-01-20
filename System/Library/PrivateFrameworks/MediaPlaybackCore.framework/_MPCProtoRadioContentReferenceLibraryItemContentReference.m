@interface _MPCProtoRadioContentReferenceLibraryItemContentReference
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoRadioContentReferenceLibraryItemContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_copyrightText, 0);
  objc_storeStrong((id *)&self->_composerName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);

  objc_storeStrong((id *)&self->_albumArtistName, 0);
}

- (unint64_t)hash
{
  NSUInteger v32 = [(NSString *)self->_albumArtistName hash];
  NSUInteger v31 = [(NSString *)self->_albumName hash];
  NSUInteger v30 = [(NSString *)self->_artistName hash];
  NSUInteger v29 = [(NSString *)self->_composerName hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v28 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_copyrightText hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v5 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v11 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = 2654435761 * self->_albumDiscCount;
  if ((has & 0x80) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_discNumber;
  if ((has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double fileSize = self->_fileSize;
  double v8 = -fileSize;
  if (fileSize >= 0.0) {
    double v8 = self->_fileSize;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_16:
  NSUInteger v12 = [(NSString *)self->_genreName hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x400) != 0)
  {
    uint64_t v14 = 2654435761 * self->_isCompilation;
    if ((v13 & 2) != 0) {
      goto LABEL_18;
    }
LABEL_23:
    unint64_t v19 = 0;
    goto LABEL_26;
  }
  uint64_t v14 = 0;
  if ((v13 & 2) == 0) {
    goto LABEL_23;
  }
LABEL_18:
  double duration = self->_duration;
  double v16 = -duration;
  if (duration >= 0.0) {
    double v16 = self->_duration;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_26:
  NSUInteger v20 = [(NSString *)self->_title hash];
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    uint64_t v22 = 2654435761 * self->_storeAdamID;
    if (v21)
    {
LABEL_28:
      uint64_t v23 = 2654435761 * self->_cloudID;
      if ((v21 & 0x20) != 0) {
        goto LABEL_29;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if (v21) {
      goto LABEL_28;
    }
  }
  uint64_t v23 = 0;
  if ((v21 & 0x20) != 0)
  {
LABEL_29:
    uint64_t v24 = 2654435761 * self->_albumTrackCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_30;
    }
LABEL_35:
    uint64_t v25 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_31;
    }
LABEL_36:
    uint64_t v26 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_34:
  uint64_t v24 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  uint64_t v25 = 2654435761 * self->_trackNumber;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_36;
  }
LABEL_31:
  uint64_t v26 = 2654435761 * self->_year;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  albumArtistName = self->_albumArtistName;
  if ((unint64_t)albumArtistName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](albumArtistName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  albumName = self->_albumName;
  if ((unint64_t)albumName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](albumName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  artistName = self->_artistName;
  if ((unint64_t)artistName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](artistName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  composerName = self->_composerName;
  if ((unint64_t)composerName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](composerName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 70);
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_contentType != *((_DWORD *)v4 + 22)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  copyrightText = self->_copyrightText;
  if ((unint64_t)copyrightText | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](copyrightText, "isEqual:")) {
      goto LABEL_77;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 70);
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_albumDiscCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_discNumber != *((_DWORD *)v4 + 26)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_fileSize != *((double *)v4 + 3)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_77;
  }
  genreName = self->_genreName;
  if ((unint64_t)genreName | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](genreName, "isEqual:")) {
      goto LABEL_77;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 70);
  }
  if ((has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0) {
      goto LABEL_77;
    }
    if (self->_isCompilation)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_77;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 15))
  {
    if (-[NSString isEqual:](title, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      __int16 v10 = *((_WORD *)v4 + 70);
      goto LABEL_52;
    }
LABEL_77:
    BOOL v14 = 0;
    goto LABEL_78;
  }
LABEL_52:
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_storeAdamID != *((void *)v4 + 4)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_77;
  }
  if (has)
  {
    if ((v10 & 1) == 0 || self->_cloudID != *((void *)v4 + 1)) {
      goto LABEL_77;
    }
  }
  else if (v10)
  {
    goto LABEL_77;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_albumTrackCount != *((_DWORD *)v4 + 16)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_trackNumber != *((_DWORD *)v4 + 32)) {
      goto LABEL_77;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_year != *((_DWORD *)v4 + 33)) {
      goto LABEL_77;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v10 & 0x200) == 0;
  }
LABEL_78:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_albumArtistName copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_albumName copyWithZone:a3];
  long double v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_artistName copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  uint64_t v12 = [(NSString *)self->_composerName copyWithZone:a3];
  __int16 v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_contentType;
    *(_WORD *)(v5 + 140) |= 0x40u;
  }
  uint64_t v14 = [(NSString *)self->_copyrightText copyWithZone:a3];
  v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_albumDiscCount;
    *(_WORD *)(v5 + 140) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 104) = self->_discNumber;
  *(_WORD *)(v5 + 140) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    *(double *)(v5 + 24) = self->_fileSize;
    *(_WORD *)(v5 + 140) |= 4u;
  }
LABEL_7:
  uint64_t v17 = [(NSString *)self->_genreName copyWithZone:a3];
  double v18 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v17;

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 136) = self->_isCompilation;
    *(_WORD *)(v5 + 140) |= 0x400u;
    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_duration;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  uint64_t v20 = [(NSString *)self->_title copyWithZone:a3];
  __int16 v21 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_storeAdamID;
    *(_WORD *)(v5 + 140) |= 8u;
    __int16 v22 = (__int16)self->_has;
    if ((v22 & 1) == 0)
    {
LABEL_13:
      if ((v22 & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else if ((v22 & 1) == 0)
  {
    goto LABEL_13;
  }
  *(void *)(v5 + 8) = self->_cloudID;
  *(_WORD *)(v5 + 140) |= 1u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_14:
    if ((v22 & 0x100) == 0) {
      goto LABEL_15;
    }
LABEL_24:
    *(_DWORD *)(v5 + 128) = self->_trackNumber;
    *(_WORD *)(v5 + 140) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return (id)v5;
    }
    goto LABEL_16;
  }
LABEL_23:
  *(_DWORD *)(v5 + 64) = self->_albumTrackCount;
  *(_WORD *)(v5 + 140) |= 0x20u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0) {
    goto LABEL_24;
  }
LABEL_15:
  if ((v22 & 0x200) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 132) = self->_year;
    *(_WORD *)(v5 + 140) |= 0x200u;
  }
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_albumArtistName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_albumName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_artistName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_composerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_copyrightText)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
LABEL_17:
  if (self->_genreName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_27:
      if ((v7 & 0x20) == 0) {
        goto LABEL_28;
      }
      goto LABEL_39;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_28:
    if ((v7 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_29:
    if ((v7 & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_30:
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
LABEL_31:
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoRadioContentReferenceLibraryItemContentReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  albumArtistName = self->_albumArtistName;
  if (albumArtistName) {
    [v3 setObject:albumArtistName forKey:@"albumArtistName"];
  }
  albumName = self->_albumName;
  if (albumName) {
    [v4 setObject:albumName forKey:@"albumName"];
  }
  artistName = self->_artistName;
  if (artistName) {
    [v4 setObject:artistName forKey:@"artistName"];
  }
  composerName = self->_composerName;
  if (composerName) {
    [v4 setObject:composerName forKey:@"composerName"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    long double v9 = [NSNumber numberWithInt:self->_contentType];
    [v4 setObject:v9 forKey:@"contentType"];
  }
  copyrightText = self->_copyrightText;
  if (copyrightText) {
    [v4 setObject:copyrightText forKey:@"copyrightText"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    __int16 v21 = [NSNumber numberWithInt:self->_albumDiscCount];
    [v4 setObject:v21 forKey:@"albumDiscCount"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_15;
  }
  __int16 v22 = [NSNumber numberWithInt:self->_discNumber];
  [v4 setObject:v22 forKey:@"discNumber"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    uint64_t v12 = [NSNumber numberWithDouble:self->_fileSize];
    [v4 setObject:v12 forKey:@"fileSize"];
  }
LABEL_17:
  genreName = self->_genreName;
  if (genreName) {
    [v4 setObject:genreName forKey:@"genreName"];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x400) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_isCompilation];
    [v4 setObject:v15 forKey:@"isCompilation"];

    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    double v16 = [NSNumber numberWithDouble:self->_duration];
    [v4 setObject:v16 forKey:@"duration"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 8) != 0)
  {
    uint64_t v23 = [NSNumber numberWithLongLong:self->_storeAdamID];
    [v4 setObject:v23 forKey:@"storeAdamID"];

    __int16 v18 = (__int16)self->_has;
    if ((v18 & 1) == 0)
    {
LABEL_27:
      if ((v18 & 0x20) == 0) {
        goto LABEL_28;
      }
      goto LABEL_39;
    }
  }
  else if ((v18 & 1) == 0)
  {
    goto LABEL_27;
  }
  uint64_t v24 = [NSNumber numberWithLongLong:self->_cloudID];
  [v4 setObject:v24 forKey:@"cloudID"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_28:
    if ((v18 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v25 = [NSNumber numberWithInt:self->_albumTrackCount];
  [v4 setObject:v25 forKey:@"albumTrackCount"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x100) == 0)
  {
LABEL_29:
    if ((v18 & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_40:
  uint64_t v26 = [NSNumber numberWithInt:self->_trackNumber];
  [v4 setObject:v26 forKey:@"trackNumber"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_30:
    __int16 v19 = [NSNumber numberWithInt:self->_year];
    [v4 setObject:v19 forKey:@"year"];
  }
LABEL_31:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoRadioContentReferenceLibraryItemContentReference;
  id v4 = [(_MPCProtoRadioContentReferenceLibraryItemContentReference *)&v8 description];
  uint64_t v5 = [(_MPCProtoRadioContentReferenceLibraryItemContentReference *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end