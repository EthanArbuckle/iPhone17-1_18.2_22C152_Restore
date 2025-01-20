@interface GEORPThirdPartyPhotoSharingPreference
+ (BOOL)isValid:(id)a3;
- (BOOL)hasOptIn;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)optIn;
- (BOOL)readFrom:(id)a3;
- (GEORPThirdPartyPhotoSharingPreference)initWithDictionary:(id)a3;
- (GEORPThirdPartyPhotoSharingPreference)initWithJSON:(id)a3;
- (NSString)version;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOptIn:(BOOL)a3;
- (void)setOptIn:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPThirdPartyPhotoSharingPreference

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_optIn = a3;
}

- (void)setHasOptIn:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasOptIn
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPThirdPartyPhotoSharingPreference;
  v4 = [(GEORPThirdPartyPhotoSharingPreference *)&v8 description];
  v5 = [(GEORPThirdPartyPhotoSharingPreference *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPThirdPartyPhotoSharingPreference _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 version];
    if (v5) {
      [v4 setObject:v5 forKey:@"version"];
    }

    if (a1[20])
    {
      v6 = [NSNumber numberWithBool:a1[16]];
      if (a2) {
        v7 = @"optIn";
      }
      else {
        v7 = @"opt_in";
      }
      [v4 setObject:v6 forKey:v7];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPThirdPartyPhotoSharingPreference _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORPThirdPartyPhotoSharingPreference)initWithDictionary:(id)a3
{
  return (GEORPThirdPartyPhotoSharingPreference *)-[GEORPThirdPartyPhotoSharingPreference _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[v6 copy];
        [a1 setVersion:v7];
      }
      if (a3) {
        objc_super v8 = @"optIn";
      }
      else {
        objc_super v8 = @"opt_in";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOptIn:", objc_msgSend(v9, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPThirdPartyPhotoSharingPreference)initWithJSON:(id)a3
{
  return (GEORPThirdPartyPhotoSharingPreference *)-[GEORPThirdPartyPhotoSharingPreference _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPThirdPartyPhotoSharingPreferenceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPThirdPartyPhotoSharingPreferenceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPThirdPartyPhotoSharingPreference *)self readAll:0];
  if (self->_version) {
    objc_msgSend(v4, "setVersion:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[16] = self->_optIn;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_version copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 16) = self->_optIn;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEORPThirdPartyPhotoSharingPreference *)self readAll:1];
  [v4 readAll:1];
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](version, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_optIn)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPThirdPartyPhotoSharingPreference *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_version hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_optIn;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 1)) {
    -[GEORPThirdPartyPhotoSharingPreference setVersion:](self, "setVersion:");
  }
  if (v4[20])
  {
    self->_optIn = v4[16];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end