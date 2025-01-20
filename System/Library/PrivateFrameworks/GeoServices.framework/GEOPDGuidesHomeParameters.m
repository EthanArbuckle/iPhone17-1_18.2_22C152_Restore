@interface GEOPDGuidesHomeParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesHomeParameters)init;
- (GEOPDGuidesHomeParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readGuidesLocationEntry;
- (void)_readRefinementGuidesHome;
- (void)_readSupportedFixedSectionTypes;
- (void)_readSupportedRepeatableSectionTypes;
- (void)_readViewportInfo;
- (void)addSupportedFixedSectionType:(uint64_t)a1;
- (void)addSupportedRepeatableSectionType:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setGuidesLocationEntry:(uint64_t)a1;
- (void)setRefinementGuidesHome:(uint64_t)a1;
- (void)setResultFilter:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesHomeParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_3156;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_3157;
      }
      GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesHomeParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (GEOPDGuidesHomeParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeParameters;
  v2 = [(GEOPDGuidesHomeParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeParameters;
  v3 = [(GEOPDGuidesHomeParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDGuidesHomeParameters;
  [(GEOPDGuidesHomeParameters *)&v3 dealloc];
}

- (void)_readSupportedFixedSectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 116) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedFixedSectionTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)addSupportedFixedSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGuidesHomeParameters _readSupportedFixedSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 116) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(unsigned char *)(a1 + 116) |= 0x80u;
  }
}

- (void)_readSupportedRepeatableSectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 116) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedRepeatableSectionTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)addSupportedRepeatableSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGuidesHomeParameters _readSupportedRepeatableSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 116) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(unsigned char *)(a1 + 116) |= 0x80u;
  }
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(unsigned char *)(a1 + 116) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_3129);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 116) |= 0x40u;
    *(unsigned char *)(a1 + 116) |= 0x80u;
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)_readGuidesLocationEntry
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(unsigned char *)(a1 + 116) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesLocationEntry_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)setGuidesLocationEntry:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 116) |= 8u;
    *(unsigned char *)(a1 + 116) |= 0x80u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setResultFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 116) |= 0x20u;
    *(unsigned char *)(a1 + 116) |= 0x80u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)_readRefinementGuidesHome
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(unsigned char *)(a1 + 116) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementGuidesHome_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)setRefinementGuidesHome:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 116) |= 0x10u;
  *(unsigned char *)(a1 + 116) |= 0x80u;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesHomeParameters;
  id v4 = [(GEOPDGuidesHomeParameters *)&v8 description];
  id v5 = [(GEOPDGuidesHomeParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGuidesHomeParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53DCAE0[v8];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 24);
        }
        while (v7 < *(void *)(a1 + 32));
      }
      if (a2) {
        v10 = @"supportedFixedSectionType";
      }
      else {
        v10 = @"supported_fixed_section_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (*(void *)(a1 + 56))
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v12 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = off_1E53DCB00[v14];
          }
          [v11 addObject:v15];

          ++v13;
          v12 = (void *)(a1 + 48);
        }
        while (v13 < *(void *)(a1 + 56));
      }
      if (a2) {
        v16 = @"supportedRepeatableSectionType";
      }
      else {
        v16 = @"supported_repeatable_section_type";
      }
      [v4 setObject:v11 forKey:v16];
    }
    -[GEOPDGuidesHomeParameters _readViewportInfo](a1);
    id v17 = *(id *)(a1 + 96);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"viewportInfo";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"viewport_info";
      }
      [v4 setObject:v19 forKey:v20];
    }
    -[GEOPDGuidesHomeParameters _readGuidesLocationEntry](a1);
    id v21 = *(id *)(a1 + 72);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"guidesLocationEntry";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"guides_location_entry";
      }
      [v4 setObject:v23 forKey:v24];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 116) & 0x20) == 0)
    {
      v25 = *(void **)(a1 + 8);
      if (v25)
      {
        id v26 = v25;
        objc_sync_enter(v26);
        GEOPDGuidesHomeParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultFilter_tags_3130);
        objc_sync_exit(v26);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v27 = *(id *)(a1 + 88);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"resultFilter";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"result_filter";
      }
      [v4 setObject:v29 forKey:v30];
    }
    -[GEOPDGuidesHomeParameters _readRefinementGuidesHome](a1);
    id v31 = *(id *)(a1 + 80);
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"refinementGuidesHome";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"refinement_guides_home";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __55__GEOPDGuidesHomeParameters__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
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
  return -[GEOPDGuidesHomeParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDGuidesHomeParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
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
  return GEOPDGuidesHomeParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesHomeParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 0);
    id v5 = v10;
    if (self->_supportedFixedSectionTypes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_supportedFixedSectionTypes.count);
    }
    if (self->_supportedRepeatableSectionTypes.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < self->_supportedRepeatableSectionTypes.count);
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_guidesLocationEntry)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_resultFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_refinementGuidesHome)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    id v3 = (uint64_t *)result;
    -[GEOPDGuidesHomeParameters _readGuidesLocationEntry](result);
    if (-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](v3[9], a2)) {
      return 1;
    }
    -[GEOPDGuidesHomeParameters _readRefinementGuidesHome]((uint64_t)v3);
    if (-[GEOPDResultRefinementGuidesHome hasGreenTeaWithValue:](v3[10], a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDGuidesHomeParameters _readViewportInfo]((uint64_t)v3);
      id v4 = (void *)v3[12];
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 0);
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    id v8 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
    v9 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v8;

    id v10 = [(GEOPDGuidesLocationEntry *)self->_guidesLocationEntry copyWithZone:a3];
    v11 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v10;

    id v12 = [(GEOPDGuidesHomeResultFilter *)self->_resultFilter copyWithZone:a3];
    unint64_t v13 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v12;

    id v14 = [(GEOPDResultRefinementGuidesHome *)self->_refinementGuidesHome copyWithZone:a3];
    v15 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDGuidesHomeParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 1),
        -[GEOPDGuidesHomeParameters readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual())
    && PBRepeatedInt32IsEqual()
    && ((viewportInfo = self->_viewportInfo, !((unint64_t)viewportInfo | v4[12]))
     || -[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    && ((guidesLocationEntry = self->_guidesLocationEntry, !((unint64_t)guidesLocationEntry | v4[9]))
     || -[GEOPDGuidesLocationEntry isEqual:](guidesLocationEntry, "isEqual:"))
    && ((resultFilter = self->_resultFilter, !((unint64_t)resultFilter | v4[11]))
     || -[GEOPDGuidesHomeResultFilter isEqual:](resultFilter, "isEqual:")))
  {
    refinementGuidesHome = self->_refinementGuidesHome;
    if ((unint64_t)refinementGuidesHome | v4[10]) {
      char v9 = -[GEOPDResultRefinementGuidesHome isEqual:](refinementGuidesHome, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  unint64_t v5 = v4 ^ [(GEOPDViewportInfo *)self->_viewportInfo hash];
  unint64_t v6 = [(GEOPDGuidesLocationEntry *)self->_guidesLocationEntry hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEOPDGuidesHomeResultFilter *)self->_resultFilter hash];
  return v7 ^ [(GEOPDResultRefinementGuidesHome *)self->_refinementGuidesHome hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_resultFilter, 0);
  objc_storeStrong((id *)&self->_refinementGuidesHome, 0);
  objc_storeStrong((id *)&self->_guidesLocationEntry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end