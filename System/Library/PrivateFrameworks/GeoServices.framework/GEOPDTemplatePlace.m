@interface GEOPDTemplatePlace
+ (id)templatedPlacesForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTemplatePlace)init;
- (GEOPDTemplatePlace)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)followUpRequestMetadata;
- (id)jsonRepresentation;
- (id)templateDatas;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsTemplateData:(uint64_t)a1;
- (void)_readFollowUpRequestMetadata;
- (void)_readTemplateDatas;
- (void)addTemplateData:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTemplatePlace

+ (id)templatedPlacesForPlaceData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__GEOPDTemplatePlace_PlaceDataExtras__templatedPlacesForPlaceData___block_invoke;
  v9[3] = &unk_1E53E1880;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateValidComponentWithValuesOfType:89 usingBlock:v9];

  if ([v6 count]) {
    v7 = (void *)[v6 copy];
  }
  else {
    v7 = 0;
  }

  return v7;
}

void __67__GEOPDTemplatePlace_PlaceDataExtras__templatedPlacesForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  v11 = a2;
  v3 = -[GEOPDComponent values](v11);
  id v4 = [v3 firstObject];
  id v5 = -[GEOPDComponentValue templatePlace](v4);

  if (v11 && v5 && (*((_WORD *)v11 + 50) & 4) != 0)
  {
    id v6 = -[GEOPDComponent values](v11);
    v7 = [v6 firstObject];
    v8 = -[GEOPDComponentValue templatePlace](v7);
    v9 = *(void **)(a1 + 32);
    id v10 = [NSNumber numberWithInt:*((unsigned int *)v11 + 17)];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDTemplatePlace _readTemplateDatas](a1);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (v9)
        {
          -[GEOPDTemplateData _readFooter](*(void *)(*((void *)&v12 + 1) + 8 * i));
          if ((-[GEOPDDataItem hasGreenTeaWithValue:](*(void *)(v9 + 24), a2) & 1) != 0
            || (-[GEOPDTemplateData _readMapsId](v9),
                (objc_msgSend(*(id *)(v9 + 32), "hasGreenTeaWithValue:", a2, (void)v12) & 1) != 0)
            || (-[GEOPDTemplateData _readSubtitle](v9),
                (-[GEOPDDataItem hasGreenTeaWithValue:](*(void *)(v9 + 56), a2) & 1) != 0))
          {
            uint64_t v10 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_16:

  return v10;
}

- (GEOPDTemplatePlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTemplatePlace;
  v2 = [(GEOPDTemplatePlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTemplatePlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTemplatePlace;
  v3 = [(GEOPDTemplatePlace *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readTemplateDatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplatePlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTemplateDatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)templateDatas
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplatePlace _readTemplateDatas]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addTemplateData:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTemplatePlace _readTemplateDatas](a1);
    -[GEOPDTemplatePlace _addNoFlagsTemplateData:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 56) |= 0x10u;
  }
}

- (void)_addNoFlagsTemplateData:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readFollowUpRequestMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplatePlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFollowUpRequestMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)followUpRequestMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplatePlace _readFollowUpRequestMetadata]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTemplatePlace;
  id v4 = [(GEOPDTemplatePlace *)&v8 description];
  id v5 = [(GEOPDTemplatePlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTemplatePlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTemplatePlace readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            long long v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v8);
      }

      if (a2) {
        long long v13 = @"templateData";
      }
      else {
        long long v13 = @"template_data";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      long long v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        long long v15 = @"numInlineItems";
      }
      else {
        long long v15 = @"num_inline_items";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = -[GEOPDTemplatePlace followUpRequestMetadata]((id *)a1);
    uint64_t v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"followUpRequestMetadata";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"follow_up_request_metadata";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __48__GEOPDTemplatePlace__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTemplatePlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_8853;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_8854;
      }
      GEOPDTemplatePlaceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTemplatePlaceCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __48__GEOPDTemplatePlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTemplatePlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTemplatePlace readAll:]((uint64_t)self, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_templateDatas;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_followUpRequestMetadata) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTemplatePlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTemplatePlace readAll:]((uint64_t)self, 0);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_templateDatas;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDTemplatePlace addTemplateData:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_numInlineItems;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v14 = -[GEOPDFollowUpRequestMetadata copyWithZone:](self->_followUpRequestMetadata, "copyWithZone:", a3, (void)v18);
  long long v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDTemplatePlace readAll:]((uint64_t)self, 1);
  -[GEOPDTemplatePlace readAll:]((uint64_t)v4, 1);
  templateDatas = self->_templateDatas;
  if ((unint64_t)templateDatas | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](templateDatas, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_numInlineItems != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  followUpRequestMetadata = self->_followUpRequestMetadata;
  if ((unint64_t)followUpRequestMetadata | *((void *)v4 + 3)) {
    char v7 = -[GEOPDFollowUpRequestMetadata isEqual:](followUpRequestMetadata, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDTemplatePlace readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_templateDatas hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_numInlineItems;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(GEOPDFollowUpRequestMetadata *)self->_followUpRequestMetadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateDatas, 0);
  objc_storeStrong((id *)&self->_followUpRequestMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end