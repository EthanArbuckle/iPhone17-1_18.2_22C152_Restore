@interface GEORPFeedbackFieldAnnotations
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTranslatedTextField;
- (BOOL)hasTranslatedTextListField;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFieldAnnotations)init;
- (GEORPFeedbackFieldAnnotations)initWithData:(id)a3;
- (GEORPFeedbackFieldAnnotations)initWithDictionary:(id)a3;
- (GEORPFeedbackFieldAnnotations)initWithJSON:(id)a3;
- (GEORPFeedbackTextField)translatedTextField;
- (GEORPFeedbackTextListField)translatedTextListField;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readTranslatedTextField;
- (void)_readTranslatedTextListField;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setTranslatedTextField:(id)a3;
- (void)setTranslatedTextListField:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFieldAnnotations

- (GEORPFeedbackFieldAnnotations)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFieldAnnotations;
  v2 = [(GEORPFeedbackFieldAnnotations *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFieldAnnotations)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFieldAnnotations;
  v3 = [(GEORPFeedbackFieldAnnotations *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTranslatedTextField
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
        GEORPFeedbackFieldAnnotationsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTranslatedTextField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasTranslatedTextField
{
  return self->_translatedTextField != 0;
}

- (GEORPFeedbackTextField)translatedTextField
{
  -[GEORPFeedbackFieldAnnotations _readTranslatedTextField]((uint64_t)self);
  translatedTextField = self->_translatedTextField;

  return translatedTextField;
}

- (void)setTranslatedTextField:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_translatedTextField, a3);
}

- (void)_readTranslatedTextListField
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
        GEORPFeedbackFieldAnnotationsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTranslatedTextListField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasTranslatedTextListField
{
  return self->_translatedTextListField != 0;
}

- (GEORPFeedbackTextListField)translatedTextListField
{
  -[GEORPFeedbackFieldAnnotations _readTranslatedTextListField]((uint64_t)self);
  translatedTextListField = self->_translatedTextListField;

  return translatedTextListField;
}

- (void)setTranslatedTextListField:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_translatedTextListField, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackFieldAnnotations;
  v4 = [(GEORPFeedbackFieldAnnotations *)&v8 description];
  v5 = [(GEORPFeedbackFieldAnnotations *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldAnnotations _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 translatedTextField];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"translatedTextField";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"translated_text_field";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 translatedTextListField];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"translatedTextListField";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"translated_text_list_field";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEORPFeedbackFieldAnnotations _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackFieldAnnotations)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFieldAnnotations *)-[GEORPFeedbackFieldAnnotations _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"translatedTextField";
      }
      else {
        objc_super v6 = @"translated_text_field";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPFeedbackTextField alloc];
        if (a3) {
          uint64_t v9 = [(GEORPFeedbackTextField *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPFeedbackTextField *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setTranslatedTextField:v9];
      }
      if (a3) {
        v11 = @"translatedTextListField";
      }
      else {
        v11 = @"translated_text_list_field";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEORPFeedbackTextListField alloc];
        if (a3) {
          uint64_t v14 = [(GEORPFeedbackTextListField *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPFeedbackTextListField *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setTranslatedTextListField:v14];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackFieldAnnotations)initWithJSON:(id)a3
{
  return (GEORPFeedbackFieldAnnotations *)-[GEORPFeedbackFieldAnnotations _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_213;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_214;
    }
    GEORPFeedbackFieldAnnotationsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPFeedbackTextField *)self->_translatedTextField readAll:1];
    [(GEORPFeedbackTextListField *)self->_translatedTextListField readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFieldAnnotationsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFieldAnnotationsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackFieldAnnotationsIsDirty((uint64_t)self))
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
    [(GEORPFeedbackFieldAnnotations *)self readAll:0];
    if (self->_translatedTextField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_translatedTextListField) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPFeedbackFieldAnnotations *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_translatedTextField) {
    objc_msgSend(v4, "setTranslatedTextField:");
  }
  if (self->_translatedTextListField) {
    objc_msgSend(v4, "setTranslatedTextListField:");
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
    [(GEORPFeedbackFieldAnnotations *)self readAll:0];
    id v8 = [(GEORPFeedbackTextField *)self->_translatedTextField copyWithZone:a3];
    uint64_t v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEORPFeedbackTextListField *)self->_translatedTextListField copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackFieldAnnotationsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackFieldAnnotations *)self readAll:1],
         [v4 readAll:1],
         translatedTextField = self->_translatedTextField,
         !((unint64_t)translatedTextField | v4[2]))
     || -[GEORPFeedbackTextField isEqual:](translatedTextField, "isEqual:")))
  {
    translatedTextListField = self->_translatedTextListField;
    if ((unint64_t)translatedTextListField | v4[3]) {
      char v7 = -[GEORPFeedbackTextListField isEqual:](translatedTextListField, "isEqual:");
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
  [(GEORPFeedbackFieldAnnotations *)self readAll:1];
  unint64_t v3 = [(GEORPFeedbackTextField *)self->_translatedTextField hash];
  return [(GEORPFeedbackTextListField *)self->_translatedTextListField hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  translatedTextField = self->_translatedTextField;
  uint64_t v5 = v8[2];
  if (translatedTextField)
  {
    if (v5) {
      -[GEORPFeedbackTextField mergeFrom:](translatedTextField, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackFieldAnnotations setTranslatedTextField:](self, "setTranslatedTextField:");
  }
  translatedTextListField = self->_translatedTextListField;
  uint64_t v7 = v8[3];
  if (translatedTextListField)
  {
    if (v7) {
      -[GEORPFeedbackTextListField mergeFrom:](translatedTextListField, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackFieldAnnotations setTranslatedTextListField:](self, "setTranslatedTextListField:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatedTextListField, 0);
  objc_storeStrong((id *)&self->_translatedTextField, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end