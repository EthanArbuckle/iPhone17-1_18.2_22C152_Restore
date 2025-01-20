@interface GEORPLayoutField
+ (BOOL)isValid:(id)a3;
- (BOOL)enabled;
- (BOOL)hasDisplayText;
- (BOOL)hasEnabled;
- (BOOL)hasName;
- (BOOL)hasOrdinal;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackLayoutFieldName)name;
- (GEORPLayoutField)init;
- (GEORPLayoutField)initWithData:(id)a3;
- (GEORPLayoutField)initWithDictionary:(id)a3;
- (GEORPLayoutField)initWithJSON:(id)a3;
- (NSString)displayText;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)ordinal;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayText;
- (void)_readName;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasOrdinal:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOrdinal:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPLayoutField

- (GEORPLayoutField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPLayoutField;
  v2 = [(GEORPLayoutField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPLayoutField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPLayoutField;
  v3 = [(GEORPLayoutField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB330[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_WORKFLOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_POI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_ADDRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_OTHER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_GROUNDVIEW"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_INCIDENT_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_POI_IMAGE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPLayoutFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_16);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (GEORPFeedbackLayoutFieldName)name
{
  -[GEORPLayoutField _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readDisplayText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPLayoutFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDisplayText
{
  return self->_displayText != 0;
}

- (NSString)displayText
{
  -[GEORPLayoutField _readDisplayText]((uint64_t)self);
  displayText = self->_displayText;

  return displayText;
}

- (void)setDisplayText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_displayText, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_ordinal = a3;
}

- (void)setHasOrdinal:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasOrdinal
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPLayoutField;
  int v4 = [(GEORPLayoutField *)&v8 description];
  v5 = [(GEORPLayoutField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPLayoutField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 56) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 48);
      if (v5 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 48));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53EB330[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = [(id)a1 name];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"name"];
    }
    v10 = [(id)a1 displayText];
    if (v10)
    {
      if (a2) {
        v11 = @"displayText";
      }
      else {
        v11 = @"display_text";
      }
      [v4 setObject:v10 forKey:v11];
    }

    char v12 = *(unsigned char *)(a1 + 56);
    if ((v12 & 4) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      [v4 setObject:v13 forKey:@"enabled"];

      char v12 = *(unsigned char *)(a1 + 56);
    }
    if (v12)
    {
      v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
      [v4 setObject:v14 forKey:@"ordinal"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPLayoutField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPLayoutField)initWithDictionary:(id)a3
{
  return (GEORPLayoutField *)-[GEORPLayoutField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_40;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_40;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_WORKFLOW"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_POI"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_ADDRESS"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_OTHER"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_GROUNDVIEW"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_INCIDENT_TYPE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_LAYOUT_FIELD_TYPE_POI_IMAGE"])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_24:
    [a1 setType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEORPFeedbackLayoutFieldName alloc];
    if (a3) {
      uint64_t v11 = [(GEORPFeedbackLayoutFieldName *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEORPFeedbackLayoutFieldName *)v10 initWithDictionary:v9];
    }
    char v12 = (void *)v11;
    [a1 setName:v11];
  }
  if (a3) {
    v13 = @"displayText";
  }
  else {
    v13 = @"display_text";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setDisplayText:v15];
  }
  v16 = [v5 objectForKeyedSubscript:@"enabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnabled:", objc_msgSend(v16, "BOOLValue"));
  }

  v17 = [v5 objectForKeyedSubscript:@"ordinal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOrdinal:", objc_msgSend(v17, "unsignedIntValue"));
  }

LABEL_40:
  return a1;
}

- (GEORPLayoutField)initWithJSON:(id)a3
{
  return (GEORPLayoutField *)-[GEORPLayoutField _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_400_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_401_0;
    }
    GEORPLayoutFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPFeedbackLayoutFieldName *)self->_name readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPLayoutFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPLayoutFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPLayoutField *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_name) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_displayText) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPLayoutField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 8) = self->_readerMarkPos;
  *((_DWORD *)v6 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_type;
    *((unsigned char *)v6 + 56) |= 2u;
  }
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    int v4 = v6;
  }
  if (self->_displayText)
  {
    objc_msgSend(v6, "setDisplayText:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v4 + 52) = self->_enabled;
    *((unsigned char *)v4 + 56) |= 4u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v4 + 11) = self->_ordinal;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPLayoutFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPLayoutField *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  id v9 = [(GEORPFeedbackLayoutFieldName *)self->_name copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_displayText copyWithZone:a3];
  char v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 52) = self->_enabled;
    *(unsigned char *)(v5 + 56) |= 4u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 44) = self->_ordinal;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEORPLayoutField *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3) && !-[GEORPFeedbackLayoutFieldName isEqual:](name, "isEqual:")) {
    goto LABEL_23;
  }
  displayText = self->_displayText;
  if ((unint64_t)displayText | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayText, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) != 0)
    {
      if (self->_enabled)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_19;
      }
    }
LABEL_23:
    BOOL v7 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 56) & 4) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_ordinal != *((_DWORD *)v4 + 11)) {
      goto LABEL_23;
    }
    BOOL v7 = 1;
  }
LABEL_24:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPLayoutField *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPFeedbackLayoutFieldName *)self->_name hash];
  NSUInteger v5 = [(NSString *)self->_displayText hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_enabled;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_ordinal;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v8 = (int *)a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  if ((v8[14] & 2) != 0)
  {
    self->_type = v8[12];
    *(unsigned char *)&self->_flags |= 2u;
  }
  name = self->_name;
  uint64_t v6 = *((void *)v8 + 3);
  if (name)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPFeedbackLayoutFieldName mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPLayoutField setName:](self, "setName:");
  }
  unint64_t v4 = v8;
LABEL_9:
  if (*((void *)v4 + 2))
  {
    -[GEORPLayoutField setDisplayText:](self, "setDisplayText:");
    unint64_t v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 4) != 0)
  {
    self->_enabled = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_flags |= 4u;
    char v7 = *((unsigned char *)v4 + 56);
  }
  if (v7)
  {
    self->_ordinal = v4[11];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayText, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end