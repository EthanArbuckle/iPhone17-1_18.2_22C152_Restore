@interface GEOPBTransitIncident
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitIncident)init;
- (GEOPBTransitIncident)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)affectedEntitys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)incidentTypeArtwork;
- (id)jsonRepresentation;
- (id)longDescriptionString;
- (id)messageForAllBlocking;
- (id)messageForIncidentType;
- (id)messageString;
- (id)shortDescriptionString;
- (id)titleString;
- (os_unfair_lock_s)iconEnum;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsAffectedEntity:(uint64_t)a1;
- (void)_readAffectedEntitys;
- (void)_readIncidentTypeArtwork;
- (void)_readLongDescriptionString;
- (void)_readMessageForAllBlocking;
- (void)_readMessageForIncidentType;
- (void)_readMessageString;
- (void)_readShortDescriptionString;
- (void)_readTitleString;
- (void)addAffectedEntity:(os_unfair_lock_s *)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAffectedEntitys:(uint64_t)a1;
- (void)setLongDescriptionString:(uint64_t)a1;
- (void)setShortDescriptionString:(uint64_t)a1;
- (void)setTitleString:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitIncident

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitIncidentIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_43;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 0);
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_9;
    }
LABEL_40:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0) {
    goto LABEL_40;
  }
LABEL_9:
  if ((*(unsigned char *)&flags & 0x40) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_affectedEntitys;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_longDescriptionString) {
    PBDataWriterWriteStringField();
  }
  if (self->_shortDescriptionString) {
    PBDataWriterWriteStringField();
  }
  if (self->_titleString) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageString) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForAllBlocking) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForIncidentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_incidentTypeArtwork) {
    PBDataWriterWriteSubmessage();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_43:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 1);
  -[GEOPBTransitIncident readAll:]((uint64_t)v4, 1);
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 34);
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_incidentIndex != *((_DWORD *)v4 + 30)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_incidentMuid != *((void *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_iconEnum != *((_DWORD *)v4 + 29)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_startDatetime != *((_DWORD *)v4 + 31)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_endDatetime != *((_DWORD *)v4 + 28)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_creationDatetime != *((_DWORD *)v4 + 27)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_updatedDatetime != *((_DWORD *)v4 + 32)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  affectedEntitys = self->_affectedEntitys;
  if ((unint64_t)affectedEntitys | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](affectedEntitys, "isEqual:")) {
      goto LABEL_62;
    }
    $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 34);
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_blocking)
      {
        if (!*((unsigned char *)v4 + 132)) {
          goto LABEL_62;
        }
        goto LABEL_48;
      }
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_48;
      }
    }
LABEL_62:
    char v15 = 0;
    goto LABEL_63;
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_62;
  }
LABEL_48:
  longDescriptionString = self->_longDescriptionString;
  if ((unint64_t)longDescriptionString | *((void *)v4 + 6)
    && !-[NSString isEqual:](longDescriptionString, "isEqual:"))
  {
    goto LABEL_62;
  }
  shortDescriptionString = self->_shortDescriptionString;
  if ((unint64_t)shortDescriptionString | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](shortDescriptionString, "isEqual:")) {
      goto LABEL_62;
    }
  }
  titleString = self->_titleString;
  if ((unint64_t)titleString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](titleString, "isEqual:")) {
      goto LABEL_62;
    }
  }
  messageString = self->_messageString;
  if ((unint64_t)messageString | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](messageString, "isEqual:")) {
      goto LABEL_62;
    }
  }
  messageForAllBlocking = self->_messageForAllBlocking;
  if ((unint64_t)messageForAllBlocking | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](messageForAllBlocking, "isEqual:")) {
      goto LABEL_62;
    }
  }
  messageForIncidentType = self->_messageForIncidentType;
  if ((unint64_t)messageForIncidentType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](messageForIncidentType, "isEqual:")) {
      goto LABEL_62;
    }
  }
  incidentTypeArtwork = self->_incidentTypeArtwork;
  if ((unint64_t)incidentTypeArtwork | *((void *)v4 + 5)) {
    char v15 = -[GEOPBTransitArtwork isEqual:](incidentTypeArtwork, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_63:

  return v15;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 136) |= 0x100u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPBTransitIncident readAll:](a1, 0);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPBTransitIncidentEntity clearUnknownFields:](*(void *)(*((void *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 40), "clearUnknownFields:", 1, (void)v10);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_shortDescriptionString, 0);
  objc_storeStrong((id *)&self->_messageString, 0);
  objc_storeStrong((id *)&self->_messageForIncidentType, 0);
  objc_storeStrong((id *)&self->_messageForAllBlocking, 0);
  objc_storeStrong((id *)&self->_longDescriptionString, 0);
  objc_storeStrong((id *)&self->_incidentTypeArtwork, 0);
  objc_storeStrong((id *)&self->_affectedEntitys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPBTransitIncident)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitIncident;
  v2 = [(GEOPBTransitIncident *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPBTransitIncident)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitIncident;
  v3 = [(GEOPBTransitIncident *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (os_unfair_lock_s)iconEnum
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = v1[34]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 26);
    if ((os_unfair_lock_opaque & 8) != 0) {
      return (os_unfair_lock_s *)v1[29]._os_unfair_lock_opaque;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readAffectedEntitys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAffectedEntitys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)affectedEntitys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readAffectedEntitys]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAffectedEntitys:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 136) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)addAffectedEntity:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPBTransitIncident _readAffectedEntitys]((uint64_t)a1);
    -[GEOPBTransitIncident _addNoFlagsAffectedEntity:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[34]._os_unfair_lock_opaque |= 0x200u;
    os_unfair_lock_unlock(a1 + 26);
    a1[34]._os_unfair_lock_opaque |= 0x20000u;
  }
}

- (void)_addNoFlagsAffectedEntity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readLongDescriptionString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLongDescriptionString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)longDescriptionString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readLongDescriptionString]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLongDescriptionString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 136) |= 0x800u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readShortDescriptionString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShortDescriptionString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)shortDescriptionString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readShortDescriptionString]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setShortDescriptionString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 136) |= 0x8000u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)_readTitleString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 138) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitleString_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)titleString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readTitleString]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTitleString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 136) |= 0x10000u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)_readMessageString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMessageString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)messageString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readMessageString]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMessageForAllBlocking
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMessageForAllBlocking_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)messageForAllBlocking
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readMessageForAllBlocking]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMessageForIncidentType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMessageForIncidentType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)messageForIncidentType
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readMessageForIncidentType]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readIncidentTypeArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 137) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentTypeArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)incidentTypeArtwork
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBTransitIncident _readIncidentTypeArtwork]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitIncident;
  id v4 = [(GEOPBTransitIncident *)&v8 description];
  id v5 = [(GEOPBTransitIncident *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_80;
  }
  -[GEOPBTransitIncident readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10) != 0)
  {
    v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 120)];
    if (a2) {
      v35 = @"incidentIndex";
    }
    else {
      v35 = @"incident_index";
    }
    [v4 setObject:v34 forKey:v35];

    int v5 = *(_DWORD *)(a1 + 136);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_71;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_4;
  }
  v36 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  if (a2) {
    v37 = @"incidentMuid";
  }
  else {
    v37 = @"incident_muid";
  }
  [v4 setObject:v36 forKey:v37];

  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_89;
  }
LABEL_71:
  int v38 = *(_DWORD *)(a1 + 116);
  if (v38)
  {
    if (v38 == 1)
    {
      v39 = @"ICON_CONSTRUCTION";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 116));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v39 = @"ICON_WARNING";
  }
  if (a2) {
    v47 = @"iconEnum";
  }
  else {
    v47 = @"icon_enum";
  }
  [v4 setObject:v39 forKey:v47];

  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_93;
  }
LABEL_89:
  v48 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
  if (a2) {
    v49 = @"startDatetime";
  }
  else {
    v49 = @"start_datetime";
  }
  [v4 setObject:v48 forKey:v49];

  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
LABEL_97:
    v52 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
    if (a2) {
      v53 = @"creationDatetime";
    }
    else {
      v53 = @"creation_datetime";
    }
    [v4 setObject:v52 forKey:v53];

    if ((*(_DWORD *)(a1 + 136) & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_93:
  v50 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 112)];
  if (a2) {
    v51 = @"endDatetime";
  }
  else {
    v51 = @"end_datetime";
  }
  [v4 setObject:v50 forKey:v51];

  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 2) != 0) {
    goto LABEL_97;
  }
LABEL_8:
  if ((v5 & 0x40) != 0)
  {
LABEL_9:
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
    if (a2) {
      id v7 = @"updatedDatetime";
    }
    else {
      id v7 = @"updated_datetime";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_13:
  if ([*(id *)(a1 + 24) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v9 = *(id *)(a1 + 24);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          uint64_t v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v11);
    }

    if (a2) {
      long long v16 = @"affectedEntity";
    }
    else {
      long long v16 = @"affected_entity";
    }
    [v4 setObject:v8 forKey:v16];
  }
  if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
  {
    v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 132)];
    [v4 setObject:v17 forKey:@"blocking"];
  }
  uint64_t v18 = -[GEOPBTransitIncident longDescriptionString]((id *)a1);
  if (v18)
  {
    if (a2) {
      v19 = @"longDescriptionString";
    }
    else {
      v19 = @"long_description_string";
    }
    [v4 setObject:v18 forKey:v19];
  }

  v20 = -[GEOPBTransitIncident shortDescriptionString]((id *)a1);
  if (v20)
  {
    if (a2) {
      v21 = @"shortDescriptionString";
    }
    else {
      v21 = @"short_description_string";
    }
    [v4 setObject:v20 forKey:v21];
  }

  v22 = -[GEOPBTransitIncident titleString]((id *)a1);
  if (v22)
  {
    if (a2) {
      v23 = @"titleString";
    }
    else {
      v23 = @"title_string";
    }
    [v4 setObject:v22 forKey:v23];
  }

  v24 = -[GEOPBTransitIncident messageString]((id *)a1);
  if (v24)
  {
    if (a2) {
      v25 = @"messageString";
    }
    else {
      v25 = @"message_string";
    }
    [v4 setObject:v24 forKey:v25];
  }

  v26 = -[GEOPBTransitIncident messageForAllBlocking]((id *)a1);
  if (v26)
  {
    if (a2) {
      v27 = @"messageForAllBlocking";
    }
    else {
      v27 = @"message_for_all_blocking";
    }
    [v4 setObject:v26 forKey:v27];
  }

  v28 = -[GEOPBTransitIncident messageForIncidentType]((id *)a1);
  if (v28)
  {
    if (a2) {
      v29 = @"messageForIncidentType";
    }
    else {
      v29 = @"message_for_incident_type";
    }
    [v4 setObject:v28 forKey:v29];
  }

  v30 = -[GEOPBTransitIncident incidentTypeArtwork]((id *)a1);
  v31 = v30;
  if (v30)
  {
    if (a2)
    {
      v32 = [v30 jsonRepresentation];
      v33 = @"incidentTypeArtwork";
    }
    else
    {
      v32 = [v30 dictionaryRepresentation];
      v33 = @"incident_type_artwork";
    }
    [v4 setObject:v32 forKey:v33];
  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    v41 = [v40 dictionaryRepresentation];
    v42 = v41;
    if (a2)
    {
      v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __50__GEOPBTransitIncident__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E53D8860;
      id v44 = v43;
      id v55 = v44;
      [v42 enumerateKeysAndObjectsUsingBlock:v54];
      id v45 = v44;

      v42 = v45;
    }
    [v4 setObject:v42 forKey:@"Unknown Fields"];
  }
LABEL_80:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_363;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_364;
      }
      GEOPBTransitIncidentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPBTransitIncidentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __50__GEOPBTransitIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    uint64_t v6 = 0;
    goto LABEL_128;
  }
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"incidentIndex";
    }
    else {
      id v7 = @"incident_index";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v8 unsignedIntValue];
      *(_DWORD *)(v6 + 136) |= 0x20000u;
      *(_DWORD *)(v6 + 136) |= 0x10u;
      *(_DWORD *)(v6 + 120) = v9;
    }

    if (a3) {
      id v10 = @"incidentMuid";
    }
    else {
      id v10 = @"incident_muid";
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 unsignedLongLongValue];
      *(_DWORD *)(v6 + 136) |= 0x20000u;
      *(_DWORD *)(v6 + 136) |= 1u;
      *(void *)(v6 + 32) = v12;
    }

    if (a3) {
      long long v13 = @"iconEnum";
    }
    else {
      long long v13 = @"icon_enum";
    }
    long long v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
      if ([v15 isEqualToString:@"ICON_WARNING"]) {
        int v16 = 0;
      }
      else {
        int v16 = [v15 isEqualToString:@"ICON_CONSTRUCTION"];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_24:

        if (a3) {
          v17 = @"startDatetime";
        }
        else {
          v17 = @"start_datetime";
        }
        uint64_t v18 = [v5 objectForKeyedSubscript:v17];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v19 = [v18 unsignedIntValue];
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 0x20u;
          *(_DWORD *)(v6 + 124) = v19;
        }

        if (a3) {
          v20 = @"endDatetime";
        }
        else {
          v20 = @"end_datetime";
        }
        v21 = [v5 objectForKeyedSubscript:v20];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v22 = [v21 unsignedIntValue];
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 4u;
          *(_DWORD *)(v6 + 112) = v22;
        }

        if (a3) {
          v23 = @"creationDatetime";
        }
        else {
          v23 = @"creation_datetime";
        }
        v24 = [v5 objectForKeyedSubscript:v23];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v25 = [v24 unsignedIntValue];
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 2u;
          *(_DWORD *)(v6 + 108) = v25;
        }

        if (a3) {
          v26 = @"updatedDatetime";
        }
        else {
          v26 = @"updated_datetime";
        }
        v27 = [v5 objectForKeyedSubscript:v26];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v28 = [v27 unsignedIntValue];
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 0x40u;
          *(_DWORD *)(v6 + 128) = v28;
        }

        if (a3) {
          v29 = @"affectedEntity";
        }
        else {
          v29 = @"affected_entity";
        }
        v30 = [v5 objectForKeyedSubscript:v29];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v89 = a3;
          v87 = v30;
          id v88 = v5;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v31 = v30;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v100 objects:v108 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            v34 = @"affected_muid";
            uint64_t v35 = *(void *)v101;
            if (a3) {
              v34 = @"affectedMuid";
            }
            v97 = v34;
            v36 = @"nextStopMuid";
            if (!a3) {
              v36 = @"next_stop_muid";
            }
            v94 = v36;
            uint64_t v95 = v6;
            uint64_t v90 = *(void *)v101;
            id v91 = v31;
            do
            {
              uint64_t v37 = 0;
              uint64_t v98 = v33;
              do
              {
                if (*(void *)v101 != v35) {
                  objc_enumerationMutation(v31);
                }
                int v38 = *(void **)(*((void *)&v100 + 1) + 8 * v37);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v39 = [GEOPBTransitIncidentEntity alloc];
                  if (v39)
                  {
                    v40 = v39;
                    id v41 = v38;
                    uint64_t v42 = [(GEOPBTransitIncidentEntity *)v40 init];
                    if (v42)
                    {
                      v99 = v41;
                      v43 = [v41 objectForKeyedSubscript:v97];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v44 = [v43 unsignedLongLongValue];
                        *(unsigned char *)(v42 + 32) |= 1u;
                        *(void *)(v42 + 16) = v44;
                      }

                      id v41 = v99;
                      id v45 = [v99 objectForKeyedSubscript:@"filter"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v46 = [GEOPBTransitIncidentEntityFilter alloc];
                        v96 = v45;
                        if (v46)
                        {
                          id v47 = v45;
                          v46 = [(GEOPBTransitIncidentEntityFilter *)v46 init];
                          if (v46)
                          {
                            v48 = [v47 objectForKeyedSubscript:v94];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v92 = v48;
                              id v93 = v47;
                              long long v106 = 0u;
                              long long v107 = 0u;
                              long long v104 = 0u;
                              long long v105 = 0u;
                              id v49 = v48;
                              uint64_t v50 = [v49 countByEnumeratingWithState:&v104 objects:v109 count:16];
                              if (v50)
                              {
                                uint64_t v51 = v50;
                                uint64_t v52 = *(void *)v105;
                                do
                                {
                                  for (uint64_t i = 0; i != v51; ++i)
                                  {
                                    if (*(void *)v105 != v52) {
                                      objc_enumerationMutation(v49);
                                    }
                                    v54 = *(void **)(*((void *)&v104 + 1) + 8 * i);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      [v54 unsignedLongLongValue];
                                      PBRepeatedUInt64Add();
                                    }
                                  }
                                  uint64_t v51 = [v49 countByEnumeratingWithState:&v104 objects:v109 count:16];
                                }
                                while (v51);
                              }

                              uint64_t v35 = v90;
                              id v31 = v91;
                              v48 = v92;
                              id v47 = v93;
                            }

                            uint64_t v6 = v95;
                          }
                        }
                        id v55 = v46;
                        objc_storeStrong((id *)(v42 + 24), v46);

                        id v41 = v99;
                        id v45 = v96;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v42 = 0;
                  }
                  -[GEOPBTransitIncident addAffectedEntity:]((os_unfair_lock_s *)v6, (void *)v42);

                  uint64_t v33 = v98;
                }
                ++v37;
              }
              while (v37 != v33);
              uint64_t v56 = [v31 countByEnumeratingWithState:&v100 objects:v108 count:16];
              uint64_t v33 = v56;
            }
            while (v56);
          }

          v30 = v87;
          id v5 = v88;
          a3 = v89;
        }

        long long v57 = [v5 objectForKeyedSubscript:@"blocking"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v58 = [v57 BOOLValue];
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 0x80u;
          *(unsigned char *)(v6 + 132) = v58;
        }

        if (a3) {
          long long v59 = @"longDescriptionString";
        }
        else {
          long long v59 = @"long_description_string";
        }
        v60 = [v5 objectForKeyedSubscript:v59];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v61 = (void *)[v60 copy];
          -[GEOPBTransitIncident setLongDescriptionString:](v6, v61);
        }
        if (a3) {
          v62 = @"shortDescriptionString";
        }
        else {
          v62 = @"short_description_string";
        }
        v63 = [v5 objectForKeyedSubscript:v62];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v64 = (void *)[v63 copy];
          -[GEOPBTransitIncident setShortDescriptionString:](v6, v64);
        }
        if (a3) {
          v65 = @"titleString";
        }
        else {
          v65 = @"title_string";
        }
        v66 = [v5 objectForKeyedSubscript:v65];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v67 = (void *)[v66 copy];
          -[GEOPBTransitIncident setTitleString:](v6, v67);
        }
        if (a3) {
          v68 = @"messageString";
        }
        else {
          v68 = @"message_string";
        }
        v69 = [v5 objectForKeyedSubscript:v68];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v70 = (void *)[v69 copy];
          id v71 = v70;
          *(_DWORD *)(v6 + 136) |= 0x4000u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 72), v70);
        }
        if (a3) {
          v72 = @"messageForAllBlocking";
        }
        else {
          v72 = @"message_for_all_blocking";
        }
        v73 = [v5 objectForKeyedSubscript:v72];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v74 = (void *)[v73 copy];
          id v75 = v74;
          *(_DWORD *)(v6 + 136) |= 0x1000u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 56), v74);
        }
        if (a3) {
          v76 = @"messageForIncidentType";
        }
        else {
          v76 = @"message_for_incident_type";
        }
        v77 = [v5 objectForKeyedSubscript:v76];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v78 = (void *)[v77 copy];
          id v79 = v78;
          *(_DWORD *)(v6 + 136) |= 0x2000u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 64), v78);
        }
        if (a3) {
          v80 = @"incidentTypeArtwork";
        }
        else {
          v80 = @"incident_type_artwork";
        }
        v81 = [v5 objectForKeyedSubscript:v80];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v82 = [GEOPBTransitArtwork alloc];
          if (a3) {
            v83 = [(GEOPBTransitArtwork *)v82 initWithJSON:v81];
          }
          else {
            v83 = [(GEOPBTransitArtwork *)v82 initWithDictionary:v81];
          }
          v84 = v83;
          v85 = v83;
          *(_DWORD *)(v6 + 136) |= 0x400u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 40), v84);
        }
        goto LABEL_128;
      }
      int v16 = [v14 intValue];
    }
    *(_DWORD *)(v6 + 136) |= 0x20000u;
    *(_DWORD *)(v6 + 136) |= 8u;
    *(_DWORD *)(v6 + 116) = v16;
    goto LABEL_24;
  }
LABEL_128:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitIncidentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 0);
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_incidentIndex;
    *(_DWORD *)(v5 + 136) |= 0x10u;
    $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v5 + 32) = self->_incidentMuid;
  *(_DWORD *)(v5 + 136) |= 1u;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 116) = self->_iconEnum;
  *(_DWORD *)(v5 + 136) |= 8u;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 124) = self->_startDatetime;
  *(_DWORD *)(v5 + 136) |= 0x20u;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_11;
    }
LABEL_29:
    *(_DWORD *)(v5 + 108) = self->_creationDatetime;
    *(_DWORD *)(v5 + 136) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_28:
  *(_DWORD *)(v5 + 112) = self->_endDatetime;
  *(_DWORD *)(v5 + 136) |= 4u;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0) {
    goto LABEL_29;
  }
LABEL_11:
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 128) = self->_updatedDatetime;
    *(_DWORD *)(v5 + 136) |= 0x40u;
  }
LABEL_13:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = self->_affectedEntitys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "copyWithZone:", a3, (void)v31);
        -[GEOPBTransitIncident addAffectedEntity:]((os_unfair_lock_s *)v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 132) = self->_blocking;
    *(_DWORD *)(v5 + 136) |= 0x80u;
  }
  uint64_t v15 = -[NSString copyWithZone:](self->_longDescriptionString, "copyWithZone:", a3, (void)v31);
  int v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  uint64_t v17 = [(NSString *)self->_shortDescriptionString copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  uint64_t v19 = [(NSString *)self->_titleString copyWithZone:a3];
  v20 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v19;

  uint64_t v21 = [(NSString *)self->_messageString copyWithZone:a3];
  int v22 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v21;

  uint64_t v23 = [(NSString *)self->_messageForAllBlocking copyWithZone:a3];
  v24 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v23;

  uint64_t v25 = [(NSString *)self->_messageForIncidentType copyWithZone:a3];
  v26 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v25;

  id v27 = [(GEOPBTransitArtwork *)self->_incidentTypeArtwork copyWithZone:a3];
  int v28 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v27;

  v29 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v29;
LABEL_23:

  return (id)v5;
}

- (unint64_t)hash
{
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 1);
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_incidentIndex;
    if (*(unsigned char *)&flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_incidentMuid;
      if ((*(unsigned char *)&flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_iconEnum;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_startDatetime;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_endDatetime;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_creationDatetime;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_updatedDatetime;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
LABEL_16:
  uint64_t v11 = [(NSMutableArray *)self->_affectedEntitys hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v12 = 2654435761 * self->_blocking;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
  NSUInteger v14 = [(NSString *)self->_longDescriptionString hash];
  NSUInteger v15 = v13 ^ v14 ^ [(NSString *)self->_shortDescriptionString hash];
  NSUInteger v16 = [(NSString *)self->_titleString hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_messageString hash];
  NSUInteger v18 = v15 ^ v17 ^ [(NSString *)self->_messageForAllBlocking hash];
  NSUInteger v19 = [(NSString *)self->_messageForIncidentType hash];
  return v18 ^ v19 ^ [(GEOPBTransitArtwork *)self->_incidentTypeArtwork hash];
}

@end