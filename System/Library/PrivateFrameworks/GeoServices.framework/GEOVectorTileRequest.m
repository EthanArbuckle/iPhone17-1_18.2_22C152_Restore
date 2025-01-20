@interface GEOVectorTileRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAccessKey;
- (BOOL)hasCountryCode;
- (BOOL)hasLanguageCode;
- (BOOL)hasLatitudeHint;
- (BOOL)hasLineId;
- (BOOL)hasLongitudeHint;
- (BOOL)hasPreflight;
- (BOOL)hasScale;
- (BOOL)hasSize;
- (BOOL)hasStyle;
- (BOOL)hasVenuesPreflight;
- (BOOL)hasVersion;
- (BOOL)hasVloc;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)hasZ;
- (BOOL)isEqual:(id)a3;
- (BOOL)preflight;
- (BOOL)readFrom:(id)a3;
- (BOOL)venuesPreflight;
- (BOOL)vloc;
- (GEOVectorTileRequest)init;
- (GEOVectorTileRequest)initWithData:(id)a3;
- (GEOVectorTileRequest)initWithDictionary:(id)a3;
- (GEOVectorTileRequest)initWithJSON:(id)a3;
- (NSString)accessKey;
- (NSString)countryCode;
- (NSString)languageCode;
- (float)latitudeHint;
- (float)longitudeHint;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)lineId;
- (unsigned)scale;
- (unsigned)size;
- (unsigned)style;
- (unsigned)version;
- (unsigned)x;
- (unsigned)y;
- (unsigned)z;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAccessKey;
- (void)_readCountryCode;
- (void)_readLanguageCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessKey:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setHasLatitudeHint:(BOOL)a3;
- (void)setHasLineId:(BOOL)a3;
- (void)setHasLongitudeHint:(BOOL)a3;
- (void)setHasPreflight:(BOOL)a3;
- (void)setHasScale:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setHasStyle:(BOOL)a3;
- (void)setHasVenuesPreflight:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasVloc:(BOOL)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setHasZ:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLatitudeHint:(float)a3;
- (void)setLineId:(unint64_t)a3;
- (void)setLongitudeHint:(float)a3;
- (void)setPreflight:(BOOL)a3;
- (void)setScale:(unsigned int)a3;
- (void)setSize:(unsigned int)a3;
- (void)setStyle:(unsigned int)a3;
- (void)setVenuesPreflight:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVloc:(BOOL)a3;
- (void)setX:(unsigned int)a3;
- (void)setY:(unsigned int)a3;
- (void)setZ:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVectorTileRequest

- (GEOVectorTileRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVectorTileRequest;
  v2 = [(GEOVectorTileRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVectorTileRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVectorTileRequest;
  v3 = [(GEOVectorTileRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)x
{
  return self->_x;
}

- (void)setX:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  if (a3) {
    int v3 = 65664;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasX
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (unsigned)y
{
  return self->_y;
}

- (void)setY:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    int v3 = 65792;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasY
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)z
{
  return self->_z;
}

- (void)setZ:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  if (a3) {
    int v3 = 66048;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasZ
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 65600;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 65568;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasStyle
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readLanguageCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 101) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVectorTileRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguageCode_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (NSString)languageCode
{
  -[GEOVectorTileRequest _readLanguageCode]((uint64_t)self);
  languageCode = self->_languageCode;

  return languageCode;
}

- (void)setLanguageCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (BOOL)preflight
{
  return self->_preflight;
}

- (void)setPreflight:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  self->_preflight = a3;
}

- (void)setHasPreflight:(BOOL)a3
{
  if (a3) {
    int v3 = 66560;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasPreflight
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unint64_t)lineId
{
  return self->_lineId;
}

- (void)setLineId:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_lineId = a3;
}

- (void)setHasLineId:(BOOL)a3
{
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasLineId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    int v3 = 65552;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)scale
{
  return self->_scale;
}

- (void)setScale:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_scale = a3;
}

- (void)setHasScale:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasScale
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readAccessKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 101) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVectorTileRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccessKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAccessKey
{
  return self->_accessKey != 0;
}

- (NSString)accessKey
{
  -[GEOVectorTileRequest _readAccessKey]((uint64_t)self);
  accessKey = self->_accessKey;

  return accessKey;
}

- (void)setAccessKey:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_accessKey, a3);
}

- (float)longitudeHint
{
  return self->_longitudeHint;
}

- (void)setLongitudeHint:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_longitudeHint = a3;
}

- (void)setHasLongitudeHint:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLongitudeHint
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (float)latitudeHint
{
  return self->_latitudeHint;
}

- (void)setLatitudeHint:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_latitudeHint = a3;
}

- (void)setHasLatitudeHint:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasLatitudeHint
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 101) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVectorTileRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEOVectorTileRequest _readCountryCode]((uint64_t)self);
  countryCode = self->_countryCode;

  return countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (BOOL)venuesPreflight
{
  return self->_venuesPreflight;
}

- (void)setVenuesPreflight:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  self->_venuesPreflight = a3;
}

- (void)setHasVenuesPreflight:(BOOL)a3
{
  if (a3) {
    int v3 = 67584;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasVenuesPreflight
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)vloc
{
  return self->_vloc;
}

- (void)setVloc:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  self->_vloc = a3;
}

- (void)setHasVloc:(BOOL)a3
{
  if (a3) {
    int v3 = 69632;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasVloc
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVectorTileRequest;
  v4 = [(GEOVectorTileRequest *)&v8 description];
  v5 = [(GEOVectorTileRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVectorTileRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_46;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 100);
  if ((v5 & 0x80) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    [v4 setObject:v6 forKey:@"x"];

    int v5 = *(_DWORD *)(a1 + 100);
  }
  if ((v5 & 0x100) != 0)
  {
    v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
    [v4 setObject:v27 forKey:@"y"];

    int v5 = *(_DWORD *)(a1 + 100);
    if ((v5 & 0x200) == 0)
    {
LABEL_6:
      if ((v5 & 0x40) == 0) {
        goto LABEL_7;
      }
      goto LABEL_51;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_6;
  }
  v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
  [v4 setObject:v28 forKey:@"z"];

  int v5 = *(_DWORD *)(a1 + 100);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_51:
  v29 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
  [v4 setObject:v29 forKey:@"version"];

  if ((*(_DWORD *)(a1 + 100) & 0x20) != 0)
  {
LABEL_8:
    objc_super v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    [v4 setObject:v7 forKey:@"style"];
  }
LABEL_9:
  objc_super v8 = [(id)a1 languageCode];
  if (v8)
  {
    if (a2) {
      v9 = @"languageCode";
    }
    else {
      v9 = @"language_code";
    }
    [v4 setObject:v8 forKey:v9];
  }

  int v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x400) != 0)
  {
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
    [v4 setObject:v30 forKey:@"preflight"];

    int v10 = *(_DWORD *)(a1 + 100);
    if ((v10 & 1) == 0)
    {
LABEL_16:
      if ((v10 & 0x10) == 0) {
        goto LABEL_17;
      }
LABEL_58:
      v33 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      [v4 setObject:v33 forKey:@"size"];

      if ((*(_DWORD *)(a1 + 100) & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_16;
  }
  v31 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  if (a2) {
    v32 = @"lineId";
  }
  else {
    v32 = @"line_id";
  }
  [v4 setObject:v31 forKey:v32];

  int v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x10) != 0) {
    goto LABEL_58;
  }
LABEL_17:
  if ((v10 & 8) != 0)
  {
LABEL_18:
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    [v4 setObject:v11 forKey:@"scale"];
  }
LABEL_19:
  v12 = [(id)a1 accessKey];
  if (v12)
  {
    if (a2) {
      v13 = @"accessKey";
    }
    else {
      v13 = @"access_key";
    }
    [v4 setObject:v12 forKey:v13];
  }

  int v15 = *(_DWORD *)(a1 + 100);
  if ((v15 & 4) != 0)
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 64);
    v16 = [NSNumber numberWithFloat:v14];
    if (a2) {
      v17 = @"longitudeHint";
    }
    else {
      v17 = @"longitude_hint";
    }
    [v4 setObject:v16 forKey:v17];

    int v15 = *(_DWORD *)(a1 + 100);
  }
  if ((v15 & 2) != 0)
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 60);
    v18 = [NSNumber numberWithFloat:v14];
    if (a2) {
      v19 = @"latitudeHint";
    }
    else {
      v19 = @"latitude_hint";
    }
    [v4 setObject:v18 forKey:v19];
  }
  v20 = [(id)a1 countryCode];
  if (v20)
  {
    if (a2) {
      v21 = @"countryCode";
    }
    else {
      v21 = @"country_code";
    }
    [v4 setObject:v20 forKey:v21];
  }

  int v22 = *(_DWORD *)(a1 + 100);
  if ((v22 & 0x800) != 0)
  {
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 97)];
    if (a2) {
      v24 = @"venuesPreflight";
    }
    else {
      v24 = @"venues_preflight";
    }
    [v4 setObject:v23 forKey:v24];

    int v22 = *(_DWORD *)(a1 + 100);
  }
  if ((v22 & 0x1000) != 0)
  {
    v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 98)];
    [v4 setObject:v25 forKey:@"vloc"];
  }
LABEL_46:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVectorTileRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVectorTileRequest)initWithDictionary:(id)a3
{
  return (GEOVectorTileRequest *)-[GEOVectorTileRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setX:", objc_msgSend(v6, "unsignedIntValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"y"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setY:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"z"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZ:", objc_msgSend(v8, "unsignedIntValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVersion:", objc_msgSend(v9, "unsignedIntValue"));
      }

      int v10 = [v5 objectForKeyedSubscript:@"style"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStyle:", objc_msgSend(v10, "unsignedIntValue"));
      }

      if (a3) {
        v11 = @"languageCode";
      }
      else {
        v11 = @"language_code";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setLanguageCode:v13];
      }
      double v14 = [v5 objectForKeyedSubscript:@"preflight"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPreflight:", objc_msgSend(v14, "BOOLValue"));
      }

      if (a3) {
        int v15 = @"lineId";
      }
      else {
        int v15 = @"line_id";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineId:", objc_msgSend(v16, "unsignedLongLongValue"));
      }

      v17 = [v5 objectForKeyedSubscript:@"size"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSize:", objc_msgSend(v17, "unsignedIntValue"));
      }

      v18 = [v5 objectForKeyedSubscript:@"scale"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setScale:", objc_msgSend(v18, "unsignedIntValue"));
      }

      if (a3) {
        v19 = @"accessKey";
      }
      else {
        v19 = @"access_key";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setAccessKey:v21];
      }
      if (a3) {
        int v22 = @"longitudeHint";
      }
      else {
        int v22 = @"longitude_hint";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v23 floatValue];
        objc_msgSend(a1, "setLongitudeHint:");
      }

      if (a3) {
        v24 = @"latitudeHint";
      }
      else {
        v24 = @"latitude_hint";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v25 floatValue];
        objc_msgSend(a1, "setLatitudeHint:");
      }

      if (a3) {
        v26 = @"countryCode";
      }
      else {
        v26 = @"country_code";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = (void *)[v27 copy];
        [a1 setCountryCode:v28];
      }
      if (a3) {
        v29 = @"venuesPreflight";
      }
      else {
        v29 = @"venues_preflight";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVenuesPreflight:", objc_msgSend(v30, "BOOLValue"));
      }

      v31 = [v5 objectForKeyedSubscript:@"vloc"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVloc:", objc_msgSend(v31, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOVectorTileRequest)initWithJSON:(id)a3
{
  return (GEOVectorTileRequest *)-[GEOVectorTileRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_47;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_47;
    }
    GEOVectorTileRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  objc_super v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    objc_super v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v6;
          int v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      uint64_t v16 = *v6;
      int v17 = *((unsigned __int8 *)a3 + v16);
      if (*((unsigned char *)a3 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v23 = 0;
          while (1)
          {
            uint64_t v24 = *v4;
            uint64_t v25 = *(void *)((char *)a3 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v27 = *(char *)(*(void *)((char *)a3 + *v7) + v25);
            *(void *)((char *)a3 + v24) = v26;
            if (v27 < 0)
            {
              BOOL v28 = v23++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 2u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v29 = 0;
          while (1)
          {
            uint64_t v30 = *v4;
            uint64_t v31 = *(void *)((char *)a3 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v33 = *(char *)(*(void *)((char *)a3 + *v7) + v31);
            *(void *)((char *)a3 + v30) = v32;
            if (v33 < 0)
            {
              BOOL v28 = v29++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 3u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v34 = 0;
          while (1)
          {
            uint64_t v35 = *v4;
            uint64_t v36 = *(void *)((char *)a3 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v38 = *(char *)(*(void *)((char *)a3 + *v7) + v36);
            *(void *)((char *)a3 + v35) = v37;
            if (v38 < 0)
            {
              BOOL v28 = v34++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 4u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v39 = 0;
          while (1)
          {
            uint64_t v40 = *v4;
            uint64_t v41 = *(void *)((char *)a3 + v40);
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v43 = *(char *)(*(void *)((char *)a3 + *v7) + v41);
            *(void *)((char *)a3 + v40) = v42;
            if (v43 < 0)
            {
              BOOL v28 = v39++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 5u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v44 = 0;
          while (1)
          {
            uint64_t v45 = *v4;
            uint64_t v46 = *(void *)((char *)a3 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v48 = *(char *)(*(void *)((char *)a3 + *v7) + v46);
            *(void *)((char *)a3 + v45) = v47;
            if (v48 < 0)
            {
              BOOL v28 = v44++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 6u:
          if (v18 == 2) {
            goto LABEL_102;
          }
          goto LABEL_125;
        case 7u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v49 = 0;
          while (1)
          {
            uint64_t v50 = *v4;
            uint64_t v51 = *(void *)((char *)a3 + v50);
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v53 = *(char *)(*(void *)((char *)a3 + *v7) + v51);
            *(void *)((char *)a3 + v50) = v52;
            if (v53 < 0)
            {
              BOOL v28 = v49++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 8u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v54 = 0;
          while (1)
          {
            uint64_t v55 = *v4;
            uint64_t v56 = *(void *)((char *)a3 + v55);
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v58 = *(char *)(*(void *)((char *)a3 + *v7) + v56);
            *(void *)((char *)a3 + v55) = v57;
            if (v58 < 0)
            {
              BOOL v28 = v54++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 9u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v59 = 0;
          while (1)
          {
            uint64_t v60 = *v4;
            uint64_t v61 = *(void *)((char *)a3 + v60);
            unint64_t v62 = v61 + 1;
            if (v61 == -1 || v62 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v63 = *(char *)(*(void *)((char *)a3 + *v7) + v61);
            *(void *)((char *)a3 + v60) = v62;
            if (v63 < 0)
            {
              BOOL v28 = v59++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 0xAu:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v64 = 0;
          while (1)
          {
            uint64_t v65 = *v4;
            uint64_t v66 = *(void *)((char *)a3 + v65);
            unint64_t v67 = v66 + 1;
            if (v66 == -1 || v67 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v68 = *(char *)(*(void *)((char *)a3 + *v7) + v66);
            *(void *)((char *)a3 + v65) = v67;
            if (v68 < 0)
            {
              BOOL v28 = v64++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 0xBu:
          if (v18 == 2) {
            goto LABEL_102;
          }
          goto LABEL_125;
        case 0xCu:
        case 0xDu:
          if (v18 != 5) {
            goto LABEL_125;
          }
          uint64_t v20 = *v4;
          unint64_t v21 = *(void *)((char *)a3 + v20);
          if (v21 > 0xFFFFFFFFFFFFFFFBLL) {
            goto LABEL_121;
          }
          unint64_t v22 = v21 + 4;
          if (v22 > *(void *)((char *)a3 + *v5)) {
            goto LABEL_121;
          }
          *(void *)((char *)a3 + v20) = v22;
          continue;
        case 0xEu:
          if (v18 != 2) {
            goto LABEL_125;
          }
LABEL_102:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_125:
          BOOL v79 = 0;
          goto LABEL_124;
        case 0xFu:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v69 = 0;
          while (1)
          {
            uint64_t v70 = *v4;
            uint64_t v71 = *(void *)((char *)a3 + v70);
            unint64_t v72 = v71 + 1;
            if (v71 == -1 || v72 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_120;
            }
            int v73 = *(char *)(*(void *)((char *)a3 + *v7) + v71);
            *(void *)((char *)a3 + v70) = v72;
            if (v73 < 0)
            {
              BOOL v28 = v69++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_122;
          }
        case 0x10u:
          if ((v10 & 7) != 0) {
            goto LABEL_125;
          }
          unsigned int v74 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_125;
          }
          continue;
      }
      while (1)
      {
        uint64_t v75 = *v4;
        uint64_t v76 = *(void *)((char *)a3 + v75);
        unint64_t v77 = v76 + 1;
        if (v76 == -1 || v77 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        int v78 = *(char *)(*(void *)((char *)a3 + *v7) + v76);
        *(void *)((char *)a3 + v75) = v77;
        if (v78 < 0)
        {
          BOOL v28 = v74++ > 8;
          if (!v28) {
            continue;
          }
        }
        goto LABEL_122;
      }
LABEL_120:
      uint64_t v16 = *v6;
LABEL_121:
      *((unsigned char *)a3 + v16) = 1;
LABEL_122:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v79 = *((unsigned char *)a3 + *v6) == 0;
LABEL_124:
  PBReaderRecallMark();
  return v79;
}

- (BOOL)readFrom:(id)a3
{
  return GEOVectorTileRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1E000) == 0)
    {
      unsigned int v9 = self->_reader;
      objc_sync_enter(v9);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      unint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v11 writeData:v10];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_38;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVectorTileRequest *)self readAll:0];
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&flags & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  $8D903536FF5EFC81363F64804503A8CD v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    $8D903536FF5EFC81363F64804503A8CD v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 1) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_14;
      }
LABEL_35:
      PBDataWriterWriteUint32Field();
      if ((*(_DWORD *)&self->_flags & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&v6 & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint64Field();
  $8D903536FF5EFC81363F64804503A8CD v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) != 0) {
    goto LABEL_35;
  }
LABEL_14:
  if ((*(unsigned char *)&v6 & 8) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
  if (self->_accessKey) {
    PBDataWriterWriteStringField();
  }
  $8D903536FF5EFC81363F64804503A8CD v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    $8D903536FF5EFC81363F64804503A8CD v7 = self->_flags;
  }
  if ((*(unsigned char *)&v7 & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  $8D903536FF5EFC81363F64804503A8CD v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    $8D903536FF5EFC81363F64804503A8CD v8 = self->_flags;
  }
  if ((*(_WORD *)&v8 & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
LABEL_38:
}

- (void)copyTo:(id)a3
{
  unsigned int v9 = (id *)a3;
  [(GEOVectorTileRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v9;
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    *((_DWORD *)v9 + 21) = self->_x;
    *((_DWORD *)v9 + 25) |= 0x80u;
    $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&flags & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v9 + 22) = self->_y;
  *((_DWORD *)v9 + 25) |= 0x100u;
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v9 + 23) = self->_z;
  *((_DWORD *)v9 + 25) |= 0x200u;
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_32:
  *((_DWORD *)v9 + 20) = self->_version;
  *((_DWORD *)v9 + 25) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v9 + 19) = self->_style;
    *((_DWORD *)v9 + 25) |= 0x20u;
  }
LABEL_7:
  if (self->_languageCode)
  {
    objc_msgSend(v9, "setLanguageCode:");
    v4 = v9;
  }
  $8D903536FF5EFC81363F64804503A8CD v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    *((unsigned char *)v4 + 96) = self->_preflight;
    *((_DWORD *)v4 + 25) |= 0x400u;
    $8D903536FF5EFC81363F64804503A8CD v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 1) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  v4[5] = self->_lineId;
  *((_DWORD *)v4 + 25) |= 1u;
  $8D903536FF5EFC81363F64804503A8CD v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_36:
  *((_DWORD *)v4 + 18) = self->_size;
  *((_DWORD *)v4 + 25) |= 0x10u;
  if ((*(_DWORD *)&self->_flags & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 17) = self->_scale;
    *((_DWORD *)v4 + 25) |= 8u;
  }
LABEL_14:
  if (self->_accessKey)
  {
    objc_msgSend(v9, "setAccessKey:");
    v4 = v9;
  }
  $8D903536FF5EFC81363F64804503A8CD v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = LODWORD(self->_longitudeHint);
    *((_DWORD *)v4 + 25) |= 4u;
    $8D903536FF5EFC81363F64804503A8CD v7 = self->_flags;
  }
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    *((_DWORD *)v4 + 15) = LODWORD(self->_latitudeHint);
    *((_DWORD *)v4 + 25) |= 2u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v9, "setCountryCode:");
    v4 = v9;
  }
  $8D903536FF5EFC81363F64804503A8CD v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
    *((unsigned char *)v4 + 97) = self->_venuesPreflight;
    *((_DWORD *)v4 + 25) |= 0x800u;
    $8D903536FF5EFC81363F64804503A8CD v8 = self->_flags;
  }
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    *((unsigned char *)v4 + 98) = self->_vloc;
    *((_DWORD *)v4 + 25) |= 0x1000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $8D903536FF5EFC81363F64804503A8CD v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVectorTileRequestReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVectorTileRequest *)self readAll:0];
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_x;
    *(_DWORD *)(v5 + 100) |= 0x80u;
    $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&flags & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 88) = self->_y;
  *(_DWORD *)(v5 + 100) |= 0x100u;
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 92) = self->_z;
  *(_DWORD *)(v5 + 100) |= 0x200u;
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_28:
  *(_DWORD *)(v5 + 80) = self->_version;
  *(_DWORD *)(v5 + 100) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 76) = self->_style;
    *(_DWORD *)(v5 + 100) |= 0x20u;
  }
LABEL_11:
  uint64_t v10 = [(NSString *)self->_languageCode copyWithZone:a3];
  id v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  $8D903536FF5EFC81363F64804503A8CD v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 96) = self->_preflight;
    *(_DWORD *)(v5 + 100) |= 0x400u;
    $8D903536FF5EFC81363F64804503A8CD v12 = self->_flags;
    if ((*(unsigned char *)&v12 & 1) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v12 & 0x10) == 0) {
        goto LABEL_14;
      }
LABEL_32:
      *(_DWORD *)(v5 + 72) = self->_size;
      *(_DWORD *)(v5 + 100) |= 0x10u;
      if ((*(_DWORD *)&self->_flags & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&v12 & 1) == 0)
  {
    goto LABEL_13;
  }
  *(void *)(v5 + 40) = self->_lineId;
  *(_DWORD *)(v5 + 100) |= 1u;
  $8D903536FF5EFC81363F64804503A8CD v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x10) != 0) {
    goto LABEL_32;
  }
LABEL_14:
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 68) = self->_scale;
    *(_DWORD *)(v5 + 100) |= 8u;
  }
LABEL_16:
  uint64_t v13 = [(NSString *)self->_accessKey copyWithZone:a3];
  char v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  $8D903536FF5EFC81363F64804503A8CD v15 = self->_flags;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    *(float *)(v5 + 64) = self->_longitudeHint;
    *(_DWORD *)(v5 + 100) |= 4u;
    $8D903536FF5EFC81363F64804503A8CD v15 = self->_flags;
  }
  if ((*(unsigned char *)&v15 & 2) != 0)
  {
    *(float *)(v5 + 60) = self->_latitudeHint;
    *(_DWORD *)(v5 + 100) |= 2u;
  }
  uint64_t v16 = [(NSString *)self->_countryCode copyWithZone:a3];
  int v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  $8D903536FF5EFC81363F64804503A8CD v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 97) = self->_venuesPreflight;
    *(_DWORD *)(v5 + 100) |= 0x800u;
    $8D903536FF5EFC81363F64804503A8CD v18 = self->_flags;
  }
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 98) = self->_vloc;
    *(_DWORD *)(v5 + 100) |= 0x1000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_80;
  }
  [(GEOVectorTileRequest *)self readAll:1];
  [v4 readAll:1];
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 25);
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_x != *((_DWORD *)v4 + 21)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_y != *((_DWORD *)v4 + 22)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_z != *((_DWORD *)v4 + 23)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 20)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_style != *((_DWORD *)v4 + 19)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_80;
    }
    $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 25);
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0) {
      goto LABEL_80;
    }
    if (self->_preflight)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_80;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_lineId != *((void *)v4 + 5)) {
      goto LABEL_80;
    }
  }
  else if (v6)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_size != *((_DWORD *)v4 + 18)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_scale != *((_DWORD *)v4 + 17)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_80;
  }
  accessKey = self->_accessKey;
  if ((unint64_t)accessKey | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](accessKey, "isEqual:")) {
      goto LABEL_80;
    }
    $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 25);
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_longitudeHint != *((float *)v4 + 16)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_latitudeHint != *((float *)v4 + 15)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_80;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_80;
    }
    $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 25);
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0) {
      goto LABEL_80;
    }
    if (self->_venuesPreflight)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_80;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) != 0)
    {
      if (self->_vloc)
      {
        if (!*((unsigned char *)v4 + 98)) {
          goto LABEL_80;
        }
      }
      else if (*((unsigned char *)v4 + 98))
      {
        goto LABEL_80;
      }
      BOOL v10 = 1;
      goto LABEL_81;
    }
LABEL_80:
    BOOL v10 = 0;
    goto LABEL_81;
  }
  BOOL v10 = (v6 & 0x1000) == 0;
LABEL_81:

  return v10;
}

- (unint64_t)hash
{
  [(GEOVectorTileRequest *)self readAll:1];
  $8D903536FF5EFC81363F64804503A8CD flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    uint64_t v32 = 2654435761 * self->_x;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
LABEL_3:
      uint64_t v31 = 2654435761 * self->_y;
      if ((*(_WORD *)&flags & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v31 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_4:
    uint64_t v30 = 2654435761 * self->_z;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v29 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&flags & 0x40) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v29 = 2654435761 * self->_version;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_6:
    uint64_t v28 = 2654435761 * self->_style;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v28 = 0;
LABEL_12:
  NSUInteger v26 = [(NSString *)self->_languageCode hash];
  $8D903536FF5EFC81363F64804503A8CD v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
    uint64_t v5 = 2654435761 * self->_preflight;
    if (*(unsigned char *)&v4)
    {
LABEL_14:
      unint64_t v6 = 2654435761u * self->_lineId;
      if ((*(unsigned char *)&v4 & 0x10) != 0) {
        goto LABEL_15;
      }
LABEL_19:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&v4 & 8) != 0) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&v4) {
      goto LABEL_14;
    }
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&v4 & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v7 = 2654435761 * self->_size;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_16:
    uint64_t v8 = 2654435761 * self->_scale;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
LABEL_21:
  NSUInteger v9 = [(NSString *)self->_accessKey hash];
  $8D903536FF5EFC81363F64804503A8CD v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    float longitudeHint = self->_longitudeHint;
    double v13 = longitudeHint;
    if (longitudeHint < 0.0) {
      double v13 = -longitudeHint;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    float latitudeHint = self->_latitudeHint;
    double v18 = latitudeHint;
    if (latitudeHint < 0.0) {
      double v18 = -latitudeHint;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_countryCode hash];
  $8D903536FF5EFC81363F64804503A8CD v22 = self->_flags;
  if ((*(_WORD *)&v22 & 0x800) != 0)
  {
    uint64_t v23 = 2654435761 * self->_venuesPreflight;
    if ((*(_WORD *)&v22 & 0x1000) != 0) {
      goto LABEL_39;
    }
LABEL_41:
    uint64_t v24 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v27 ^ v9 ^ v11 ^ v16 ^ v21 ^ v23 ^ v24;
  }
  uint64_t v23 = 0;
  if ((*(_WORD *)&v22 & 0x1000) == 0) {
    goto LABEL_41;
  }
LABEL_39:
  uint64_t v24 = 2654435761 * self->_vloc;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v27 ^ v9 ^ v11 ^ v16 ^ v21 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v9 = (unsigned int *)a3;
  [v9 readAll:0];
  $8D903536FF5EFC81363F64804503A8CD v4 = v9;
  unsigned int v5 = v9[25];
  if ((v5 & 0x80) != 0)
  {
    self->_x = v9[21];
    *(_DWORD *)&self->_flags |= 0x80u;
    unsigned int v5 = v9[25];
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_y = v9[22];
  *(_DWORD *)&self->_flags |= 0x100u;
  unsigned int v5 = v9[25];
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_z = v9[23];
  *(_DWORD *)&self->_flags |= 0x200u;
  unsigned int v5 = v9[25];
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_32:
  self->_version = v9[20];
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((v9[25] & 0x20) != 0)
  {
LABEL_6:
    self->_style = v9[19];
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_7:
  if (*((void *)v9 + 4))
  {
    -[GEOVectorTileRequest setLanguageCode:](self, "setLanguageCode:");
    $8D903536FF5EFC81363F64804503A8CD v4 = v9;
  }
  unsigned int v6 = v4[25];
  if ((v6 & 0x400) != 0)
  {
    self->_preflight = *((unsigned char *)v4 + 96);
    *(_DWORD *)&self->_flags |= 0x400u;
    unsigned int v6 = v4[25];
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_lineId = *((void *)v4 + 5);
  *(_DWORD *)&self->_flags |= 1u;
  unsigned int v6 = v4[25];
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_36:
  self->_size = v4[18];
  *(_DWORD *)&self->_flags |= 0x10u;
  if ((v4[25] & 8) != 0)
  {
LABEL_13:
    self->_scale = v4[17];
    *(_DWORD *)&self->_flags |= 8u;
  }
LABEL_14:
  if (*((void *)v4 + 2))
  {
    -[GEOVectorTileRequest setAccessKey:](self, "setAccessKey:");
    $8D903536FF5EFC81363F64804503A8CD v4 = v9;
  }
  unsigned int v7 = v4[25];
  if ((v7 & 4) != 0)
  {
    LODWORD(self->_longitudeHint) = v4[16];
    *(_DWORD *)&self->_flags |= 4u;
    unsigned int v7 = v4[25];
  }
  if ((v7 & 2) != 0)
  {
    LODWORD(self->_latitudeHint) = v4[15];
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOVectorTileRequest setCountryCode:](self, "setCountryCode:");
    $8D903536FF5EFC81363F64804503A8CD v4 = v9;
  }
  unsigned int v8 = v4[25];
  if ((v8 & 0x800) != 0)
  {
    self->_venuesPreflight = *((unsigned char *)v4 + 97);
    *(_DWORD *)&self->_flags |= 0x800u;
    unsigned int v8 = v4[25];
  }
  if ((v8 & 0x1000) != 0)
  {
    self->_vloc = *((unsigned char *)v4 + 98);
    *(_DWORD *)&self->_flags |= 0x1000u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end