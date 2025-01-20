@interface GEORPPhotoAttributionPreferencesUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPreferences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPPhotoAttributionPreferences)preferences;
- (GEORPPhotoAttributionPreferencesUpdate)initWithDictionary:(id)a3;
- (GEORPPhotoAttributionPreferencesUpdate)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPreferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPhotoAttributionPreferencesUpdate

- (BOOL)hasPreferences
{
  return self->_preferences != 0;
}

- (GEORPPhotoAttributionPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPhotoAttributionPreferencesUpdate;
  v4 = [(GEORPPhotoAttributionPreferencesUpdate *)&v8 description];
  v5 = [(GEORPPhotoAttributionPreferencesUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoAttributionPreferencesUpdate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 preferences];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"preferences"];
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
  return -[GEORPPhotoAttributionPreferencesUpdate _dictionaryRepresentation:](self, 1);
}

- (GEORPPhotoAttributionPreferencesUpdate)initWithDictionary:(id)a3
{
  return (GEORPPhotoAttributionPreferencesUpdate *)-[GEORPPhotoAttributionPreferencesUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"preferences"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEORPPhotoAttributionPreferences alloc];
        if (a3) {
          uint64_t v8 = [(GEORPPhotoAttributionPreferences *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPPhotoAttributionPreferences *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPreferences:v8];
      }
    }
  }

  return a1;
}

- (GEORPPhotoAttributionPreferencesUpdate)initWithJSON:(id)a3
{
  return (GEORPPhotoAttributionPreferencesUpdate *)-[GEORPPhotoAttributionPreferencesUpdate _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoAttributionPreferencesUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoAttributionPreferencesUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_preferences) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPPhotoAttributionPreferencesUpdate *)self readAll:0];
  if (self->_preferences) {
    objc_msgSend(v4, "setPreferences:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEORPPhotoAttributionPreferences *)self->_preferences copyWithZone:a3];
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
    [(GEORPPhotoAttributionPreferencesUpdate *)self readAll:1];
    [v4 readAll:1];
    preferences = self->_preferences;
    if ((unint64_t)preferences | v4[1]) {
      char v5 = -[GEORPPhotoAttributionPreferences isEqual:](preferences, "isEqual:");
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
  [(GEORPPhotoAttributionPreferencesUpdate *)self readAll:1];
  preferences = self->_preferences;

  return [(GEORPPhotoAttributionPreferences *)preferences hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  preferences = self->_preferences;
  uint64_t v6 = v4[1];

  if (preferences)
  {
    if (v6)
    {
      [(GEORPPhotoAttributionPreferences *)preferences mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEORPPhotoAttributionPreferencesUpdate *)self setPreferences:v6];
  }
}

- (void).cxx_destruct
{
}

@end