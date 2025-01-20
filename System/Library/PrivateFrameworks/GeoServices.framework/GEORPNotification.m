@interface GEORPNotification
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLocalizedText;
- (BOOL)hasLocalizedTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPNotification)init;
- (GEORPNotification)initWithData:(id)a3;
- (GEORPNotification)initWithDictionary:(id)a3;
- (GEORPNotification)initWithJSON:(id)a3;
- (NSString)localizedText;
- (NSString)localizedTitle;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocalizedText;
- (void)_readLocalizedTitle;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLocalizedText:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPNotification

- (GEORPNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPNotification;
  v2 = [(GEORPNotification *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPNotification)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPNotification;
  v3 = [(GEORPNotification *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalizedTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPNotificationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedTitle_tags_1773);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasLocalizedTitle
{
  return self->_localizedTitle != 0;
}

- (NSString)localizedTitle
{
  -[GEORPNotification _readLocalizedTitle]((uint64_t)self);
  localizedTitle = self->_localizedTitle;

  return localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (void)_readLocalizedText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPNotificationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedText_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasLocalizedText
{
  return self->_localizedText != 0;
}

- (NSString)localizedText
{
  -[GEORPNotification _readLocalizedText]((uint64_t)self);
  localizedText = self->_localizedText;

  return localizedText;
}

- (void)setLocalizedText:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_localizedText, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPNotification;
  v4 = [(GEORPNotification *)&v8 description];
  v5 = [(GEORPNotification *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPNotification _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 localizedTitle];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"localizedTitle";
      }
      else {
        objc_super v6 = @"localized_title";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 localizedText];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"localizedText";
      }
      else {
        objc_super v8 = @"localized_text";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEORPNotification _dictionaryRepresentation:](self, 1);
}

- (GEORPNotification)initWithDictionary:(id)a3
{
  return (GEORPNotification *)-[GEORPNotification _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"localizedTitle";
      }
      else {
        objc_super v6 = @"localized_title";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLocalizedTitle:v8];
      }
      if (a3) {
        v9 = @"localizedText";
      }
      else {
        v9 = @"localized_text";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setLocalizedText:v11];
      }
    }
  }

  return a1;
}

- (GEORPNotification)initWithJSON:(id)a3
{
  return (GEORPNotification *)-[GEORPNotification _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1774;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1775;
    }
    GEORPNotificationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPNotificationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPNotificationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPNotification *)self readAll:0];
    if (self->_localizedTitle) {
      PBDataWriterWriteStringField();
    }
    if (self->_localizedText) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPNotification *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_localizedTitle) {
    objc_msgSend(v4, "setLocalizedTitle:");
  }
  if (self->_localizedText) {
    objc_msgSend(v4, "setLocalizedText:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPNotification *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_localizedTitle copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_localizedText copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPNotificationReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPNotification *)self readAll:1],
         [v4 readAll:1],
         localizedTitle = self->_localizedTitle,
         !((unint64_t)localizedTitle | v4[3]))
     || -[NSString isEqual:](localizedTitle, "isEqual:")))
  {
    localizedText = self->_localizedText;
    if ((unint64_t)localizedText | v4[2]) {
      char v7 = -[NSString isEqual:](localizedText, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEORPNotification *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_localizedTitle hash];
  return [(NSString *)self->_localizedText hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEORPNotification setLocalizedTitle:](self, "setLocalizedTitle:");
  }
  if (v4[2]) {
    -[GEORPNotification setLocalizedText:](self, "setLocalizedText:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedText, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end