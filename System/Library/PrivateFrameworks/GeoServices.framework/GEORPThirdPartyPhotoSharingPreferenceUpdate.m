@interface GEORPThirdPartyPhotoSharingPreferenceUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPreference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPThirdPartyPhotoSharingPreference)preference;
- (GEORPThirdPartyPhotoSharingPreferenceUpdate)initWithDictionary:(id)a3;
- (GEORPThirdPartyPhotoSharingPreferenceUpdate)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPreference:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPThirdPartyPhotoSharingPreferenceUpdate

- (BOOL)hasPreference
{
  return self->_preference != 0;
}

- (GEORPThirdPartyPhotoSharingPreference)preference
{
  return self->_preference;
}

- (void)setPreference:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPThirdPartyPhotoSharingPreferenceUpdate;
  v4 = [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)&v8 description];
  v5 = [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPThirdPartyPhotoSharingPreferenceUpdate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 preference];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"preference"];
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
  return -[GEORPThirdPartyPhotoSharingPreferenceUpdate _dictionaryRepresentation:](self, 1);
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdate)initWithDictionary:(id)a3
{
  return (GEORPThirdPartyPhotoSharingPreferenceUpdate *)-[GEORPThirdPartyPhotoSharingPreferenceUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"preference"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEORPThirdPartyPhotoSharingPreference alloc];
        if (a3) {
          uint64_t v8 = [(GEORPThirdPartyPhotoSharingPreference *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPThirdPartyPhotoSharingPreference *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPreference:v8];
      }
    }
  }

  return a1;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdate)initWithJSON:(id)a3
{
  return (GEORPThirdPartyPhotoSharingPreferenceUpdate *)-[GEORPThirdPartyPhotoSharingPreferenceUpdate _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPThirdPartyPhotoSharingPreferenceUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPThirdPartyPhotoSharingPreferenceUpdateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_preference) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self readAll:0];
  if (self->_preference) {
    objc_msgSend(v4, "setPreference:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEORPThirdPartyPhotoSharingPreference *)self->_preference copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self readAll:1];
    [v4 readAll:1];
    preference = self->_preference;
    if ((unint64_t)preference | v4[1]) {
      char v5 = -[GEORPThirdPartyPhotoSharingPreference isEqual:](preference, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self readAll:1];
  preference = self->_preference;

  return [(GEORPThirdPartyPhotoSharingPreference *)preference hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  preference = self->_preference;
  uint64_t v6 = v4[1];

  if (preference)
  {
    if (v6)
    {
      [(GEORPThirdPartyPhotoSharingPreference *)preference mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self setPreference:v6];
  }
}

- (void).cxx_destruct
{
}

@end