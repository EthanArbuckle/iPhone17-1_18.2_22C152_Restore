@interface GEORPProblemCorrections
+ (BOOL)isValid:(id)a3;
+ (Class)correctedFieldType;
+ (Class)correctedFlagType;
+ (Class)photoWithMetadataType;
- (BOOL)delayed;
- (BOOL)hasComments;
- (BOOL)hasCorrectedCoordinate;
- (BOOL)hasCorrectedLabel;
- (BOOL)hasCorrectedMapLocation;
- (BOOL)hasCorrectedSearch;
- (BOOL)hasDelayed;
- (BOOL)hasDirectionsProblem;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMerchantLookupCorrections;
- (BOOL)hasPlaceProblem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedCoordinate)correctedCoordinate;
- (GEORPCorrectedLabel)correctedLabel;
- (GEORPCorrectedSearch)correctedSearch;
- (GEORPDirectionsProblem)directionsProblem;
- (GEORPMapLocation)correctedMapLocation;
- (GEORPMerchantLookupCorrections)merchantLookupCorrections;
- (GEORPPlaceProblem)placeProblem;
- (GEORPProblemCorrections)init;
- (GEORPProblemCorrections)initWithData:(id)a3;
- (GEORPProblemCorrections)initWithDictionary:(id)a3;
- (GEORPProblemCorrections)initWithJSON:(id)a3;
- (NSMutableArray)correctedFields;
- (NSMutableArray)correctedFlags;
- (NSMutableArray)photoWithMetadatas;
- (NSString)comments;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctedFieldAtIndex:(unint64_t)a3;
- (id)correctedFlagAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoWithMetadataAtIndex:(unint64_t)a3;
- (unint64_t)correctedFieldsCount;
- (unint64_t)correctedFlagsCount;
- (unint64_t)hash;
- (unint64_t)photoWithMetadatasCount;
- (void)_addNoFlagsCorrectedField:(uint64_t)a1;
- (void)_addNoFlagsCorrectedFlag:(uint64_t)a1;
- (void)_addNoFlagsPhotoWithMetadata:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readComments;
- (void)_readCorrectedCoordinate;
- (void)_readCorrectedFields;
- (void)_readCorrectedFlags;
- (void)_readCorrectedLabel;
- (void)_readCorrectedMapLocation;
- (void)_readCorrectedSearch;
- (void)_readDirectionsProblem;
- (void)_readMerchantLookupCorrections;
- (void)_readPhotoWithMetadatas;
- (void)_readPlaceProblem;
- (void)addCorrectedField:(id)a3;
- (void)addCorrectedFlag:(id)a3;
- (void)addPhotoWithMetadata:(id)a3;
- (void)clearCorrectedFields;
- (void)clearCorrectedFlags;
- (void)clearPhotoWithMetadatas;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComments:(id)a3;
- (void)setCorrectedCoordinate:(id)a3;
- (void)setCorrectedFields:(id)a3;
- (void)setCorrectedFlags:(id)a3;
- (void)setCorrectedLabel:(id)a3;
- (void)setCorrectedMapLocation:(id)a3;
- (void)setCorrectedSearch:(id)a3;
- (void)setDelayed:(BOOL)a3;
- (void)setDirectionsProblem:(id)a3;
- (void)setHasDelayed:(BOOL)a3;
- (void)setMerchantLookupCorrections:(id)a3;
- (void)setPhotoWithMetadatas:(id)a3;
- (void)setPlaceProblem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemCorrections

- (GEORPProblemCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemCorrections;
  v2 = [(GEORPProblemCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemCorrections;
  v3 = [(GEORPProblemCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCorrectedFields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)correctedFields
{
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  correctedFields = self->_correctedFields;

  return correctedFields;
}

- (void)setCorrectedFields:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  correctedFields = self->_correctedFields;
  self->_correctedFields = v4;
}

- (void)clearCorrectedFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  correctedFields = self->_correctedFields;

  [(NSMutableArray *)correctedFields removeAllObjects];
}

- (void)addCorrectedField:(id)a3
{
  id v4 = a3;
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  -[GEORPProblemCorrections _addNoFlagsCorrectedField:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsCorrectedField:(uint64_t)a1
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

- (unint64_t)correctedFieldsCount
{
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  correctedFields = self->_correctedFields;

  return [(NSMutableArray *)correctedFields count];
}

- (id)correctedFieldAtIndex:(unint64_t)a3
{
  -[GEORPProblemCorrections _readCorrectedFields]((uint64_t)self);
  correctedFields = self->_correctedFields;

  return (id)[(NSMutableArray *)correctedFields objectAtIndex:a3];
}

+ (Class)correctedFieldType
{
  return (Class)objc_opt_class();
}

- (void)_readCorrectedLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedLabel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedLabel
{
  return self->_correctedLabel != 0;
}

- (GEORPCorrectedLabel)correctedLabel
{
  -[GEORPProblemCorrections _readCorrectedLabel]((uint64_t)self);
  correctedLabel = self->_correctedLabel;

  return correctedLabel;
}

- (void)setCorrectedLabel:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_correctedLabel, a3);
}

- (void)_readCorrectedCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedCoordinate_tags_2618);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedCoordinate
{
  return self->_correctedCoordinate != 0;
}

- (GEORPCorrectedCoordinate)correctedCoordinate
{
  -[GEORPProblemCorrections _readCorrectedCoordinate]((uint64_t)self);
  correctedCoordinate = self->_correctedCoordinate;

  return correctedCoordinate;
}

- (void)setCorrectedCoordinate:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  objc_storeStrong((id *)&self->_correctedCoordinate, a3);
}

- (void)_readCorrectedSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedSearch
{
  return self->_correctedSearch != 0;
}

- (GEORPCorrectedSearch)correctedSearch
{
  -[GEORPProblemCorrections _readCorrectedSearch]((uint64_t)self);
  correctedSearch = self->_correctedSearch;

  return correctedSearch;
}

- (void)setCorrectedSearch:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_correctedSearch, a3);
}

- (void)_readCorrectedMapLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedMapLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasCorrectedMapLocation
{
  return self->_correctedMapLocation != 0;
}

- (GEORPMapLocation)correctedMapLocation
{
  -[GEORPProblemCorrections _readCorrectedMapLocation]((uint64_t)self);
  correctedMapLocation = self->_correctedMapLocation;

  return correctedMapLocation;
}

- (void)setCorrectedMapLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_correctedMapLocation, a3);
}

- (void)_readComments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComments_tags_2619);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasComments
{
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPProblemCorrections _readComments]((uint64_t)self);
  comments = self->_comments;

  return comments;
}

- (void)setComments:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (void)_readPlaceProblem
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceProblem_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPlaceProblem
{
  return self->_placeProblem != 0;
}

- (GEORPPlaceProblem)placeProblem
{
  -[GEORPProblemCorrections _readPlaceProblem]((uint64_t)self);
  placeProblem = self->_placeProblem;

  return placeProblem;
}

- (void)setPlaceProblem:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_placeProblem, a3);
}

- (void)_readDirectionsProblem
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsProblem_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasDirectionsProblem
{
  return self->_directionsProblem != 0;
}

- (GEORPDirectionsProblem)directionsProblem
{
  -[GEORPProblemCorrections _readDirectionsProblem]((uint64_t)self);
  directionsProblem = self->_directionsProblem;

  return directionsProblem;
}

- (void)setDirectionsProblem:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_directionsProblem, a3);
}

- (void)_readPhotoWithMetadatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoWithMetadatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)photoWithMetadatas
{
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  photoWithMetadatas = self->_photoWithMetadatas;

  return photoWithMetadatas;
}

- (void)setPhotoWithMetadatas:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  photoWithMetadatas = self->_photoWithMetadatas;
  self->_photoWithMetadatas = v4;
}

- (void)clearPhotoWithMetadatas
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  photoWithMetadatas = self->_photoWithMetadatas;

  [(NSMutableArray *)photoWithMetadatas removeAllObjects];
}

- (void)addPhotoWithMetadata:(id)a3
{
  id v4 = a3;
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  -[GEORPProblemCorrections _addNoFlagsPhotoWithMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsPhotoWithMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)photoWithMetadatasCount
{
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  photoWithMetadatas = self->_photoWithMetadatas;

  return [(NSMutableArray *)photoWithMetadatas count];
}

- (id)photoWithMetadataAtIndex:(unint64_t)a3
{
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  photoWithMetadatas = self->_photoWithMetadatas;

  return (id)[(NSMutableArray *)photoWithMetadatas objectAtIndex:a3];
}

+ (Class)photoWithMetadataType
{
  return (Class)objc_opt_class();
}

- (BOOL)delayed
{
  return self->_delayed;
}

- (void)setDelayed:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_delayed = a3;
}

- (void)setHasDelayed:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasDelayed
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readCorrectedFlags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedFlags_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)correctedFlags
{
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  correctedFlags = self->_correctedFlags;

  return correctedFlags;
}

- (void)setCorrectedFlags:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  correctedFlags = self->_correctedFlags;
  self->_correctedFlags = v4;
}

- (void)clearCorrectedFlags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  correctedFlags = self->_correctedFlags;

  [(NSMutableArray *)correctedFlags removeAllObjects];
}

- (void)addCorrectedFlag:(id)a3
{
  id v4 = a3;
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  -[GEORPProblemCorrections _addNoFlagsCorrectedFlag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsCorrectedFlag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)correctedFlagsCount
{
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  correctedFlags = self->_correctedFlags;

  return [(NSMutableArray *)correctedFlags count];
}

- (id)correctedFlagAtIndex:(unint64_t)a3
{
  -[GEORPProblemCorrections _readCorrectedFlags]((uint64_t)self);
  correctedFlags = self->_correctedFlags;

  return (id)[(NSMutableArray *)correctedFlags objectAtIndex:a3];
}

+ (Class)correctedFlagType
{
  return (Class)objc_opt_class();
}

- (void)_readMerchantLookupCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantLookupCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasMerchantLookupCorrections
{
  return self->_merchantLookupCorrections != 0;
}

- (GEORPMerchantLookupCorrections)merchantLookupCorrections
{
  -[GEORPProblemCorrections _readMerchantLookupCorrections]((uint64_t)self);
  merchantLookupCorrections = self->_merchantLookupCorrections;

  return merchantLookupCorrections;
}

- (void)setMerchantLookupCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_merchantLookupCorrections, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemCorrections;
  id v4 = [(GEORPProblemCorrections *)&v8 description];
  id v5 = [(GEORPProblemCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v72 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v71 objects:v77 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"correctedField";
      }
      else {
        v13 = @"corrected_field";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 correctedLabel];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"correctedLabel";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"corrected_label";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 correctedCoordinate];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"correctedCoordinate";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"corrected_coordinate";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = [(id)a1 correctedSearch];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"correctedSearch";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"corrected_search";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [(id)a1 correctedMapLocation];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"correctedMapLocation";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"corrected_map_location";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = [(id)a1 comments];
    if (v30) {
      [v4 setObject:v30 forKey:@"comments"];
    }

    v31 = [(id)a1 placeProblem];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"placeProblem";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"place_problem";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = [(id)a1 directionsProblem];
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"directionsProblem";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"directions_problem";
      }
      [v4 setObject:v37 forKey:v38];
    }
    if ([*(id *)(a1 + 88) count])
    {
      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v40 = *(id *)(a1 + 88);
      uint64_t v41 = [v40 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v68 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            if (a2) {
              [v45 jsonRepresentation];
            }
            else {
            v46 = [v45 dictionaryRepresentation];
            }
            [v39 addObject:v46];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v67 objects:v76 count:16];
        }
        while (v42);
      }

      if (a2) {
        v47 = @"photoWithMetadata";
      }
      else {
        v47 = @"photo_with_metadata";
      }
      [v4 setObject:v39 forKey:v47];
    }
    if (*(_WORD *)(a1 + 120))
    {
      v48 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 116)];
      [v4 setObject:v48 forKey:@"delayed"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v50 = *(id *)(a1 + 40);
      uint64_t v51 = [v50 countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v64;
        do
        {
          for (uint64_t k = 0; k != v52; ++k)
          {
            if (*(void *)v64 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = *(void **)(*((void *)&v63 + 1) + 8 * k);
            if (a2) {
              [v55 jsonRepresentation];
            }
            else {
            v56 = objc_msgSend(v55, "dictionaryRepresentation", (void)v63);
            }
            objc_msgSend(v49, "addObject:", v56, (void)v63);
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v63 objects:v75 count:16];
        }
        while (v52);
      }

      if (a2) {
        v57 = @"correctedFlag";
      }
      else {
        v57 = @"corrected_flag";
      }
      objc_msgSend(v4, "setObject:forKey:", v49, v57, (void)v63);
    }
    v58 = [(id)a1 merchantLookupCorrections];
    v59 = v58;
    if (v58)
    {
      if (a2)
      {
        v60 = [v58 jsonRepresentation];
        v61 = @"merchantLookupCorrections";
      }
      else
      {
        v60 = [v58 dictionaryRepresentation];
        v61 = @"merchant_lookup_corrections";
      }
      [v4 setObject:v60 forKey:v61];
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
  return -[GEORPProblemCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemCorrections)initWithDictionary:(id)a3
{
  return (GEORPProblemCorrections *)-[GEORPProblemCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"correctedField";
      }
      else {
        id v6 = @"corrected_field";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v78 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v87 objects:v93 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v88;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v88 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v87 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEORPCorrectedField alloc];
                if (a3) {
                  uint64_t v15 = [(GEORPCorrectedField *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEORPCorrectedField *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addCorrectedField:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v87 objects:v93 count:16];
          }
          while (v10);
        }

        id v5 = v78;
      }

      if (a3) {
        v17 = @"correctedLabel";
      }
      else {
        v17 = @"corrected_label";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEORPCorrectedLabel alloc];
        if (a3) {
          uint64_t v20 = [(GEORPCorrectedLabel *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEORPCorrectedLabel *)v19 initWithDictionary:v18];
        }
        v21 = (void *)v20;
        [a1 setCorrectedLabel:v20];
      }
      if (a3) {
        v22 = @"correctedCoordinate";
      }
      else {
        v22 = @"corrected_coordinate";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [GEORPCorrectedCoordinate alloc];
        if (a3) {
          uint64_t v25 = [(GEORPCorrectedCoordinate *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEORPCorrectedCoordinate *)v24 initWithDictionary:v23];
        }
        v26 = (void *)v25;
        [a1 setCorrectedCoordinate:v25];
      }
      if (a3) {
        v27 = @"correctedSearch";
      }
      else {
        v27 = @"corrected_search";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = [GEORPCorrectedSearch alloc];
        if (a3) {
          uint64_t v30 = [(GEORPCorrectedSearch *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEORPCorrectedSearch *)v29 initWithDictionary:v28];
        }
        v31 = (void *)v30;
        [a1 setCorrectedSearch:v30];
      }
      if (a3) {
        v32 = @"correctedMapLocation";
      }
      else {
        v32 = @"corrected_map_location";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = [GEORPMapLocation alloc];
        if (a3) {
          uint64_t v35 = [(GEORPMapLocation *)v34 initWithJSON:v33];
        }
        else {
          uint64_t v35 = [(GEORPMapLocation *)v34 initWithDictionary:v33];
        }
        v36 = (void *)v35;
        [a1 setCorrectedMapLocation:v35];
      }
      v37 = [v5 objectForKeyedSubscript:@"comments"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = (void *)[v37 copy];
        [a1 setComments:v38];
      }
      if (a3) {
        v39 = @"placeProblem";
      }
      else {
        v39 = @"place_problem";
      }
      id v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v41 = [GEORPPlaceProblem alloc];
        if (a3) {
          uint64_t v42 = [(GEORPPlaceProblem *)v41 initWithJSON:v40];
        }
        else {
          uint64_t v42 = [(GEORPPlaceProblem *)v41 initWithDictionary:v40];
        }
        uint64_t v43 = (void *)v42;
        [a1 setPlaceProblem:v42];
      }
      if (a3) {
        v44 = @"directionsProblem";
      }
      else {
        v44 = @"directions_problem";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [GEORPDirectionsProblem alloc];
        if (a3) {
          uint64_t v47 = [(GEORPDirectionsProblem *)v46 initWithJSON:v45];
        }
        else {
          uint64_t v47 = [(GEORPDirectionsProblem *)v46 initWithDictionary:v45];
        }
        v48 = (void *)v47;
        [a1 setDirectionsProblem:v47];
      }
      if (a3) {
        v49 = @"photoWithMetadata";
      }
      else {
        v49 = @"photo_with_metadata";
      }
      id v50 = [v5 objectForKeyedSubscript:v49];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v51 = v50;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v83 objects:v92 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v84;
          do
          {
            for (uint64_t j = 0; j != v53; ++j)
            {
              if (*(void *)v84 != v54) {
                objc_enumerationMutation(v51);
              }
              uint64_t v56 = *(void *)(*((void *)&v83 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v57 = [GEORPPhotoWithMetadata alloc];
                if (a3) {
                  uint64_t v58 = [(GEORPPhotoWithMetadata *)v57 initWithJSON:v56];
                }
                else {
                  uint64_t v58 = [(GEORPPhotoWithMetadata *)v57 initWithDictionary:v56];
                }
                v59 = (void *)v58;
                [a1 addPhotoWithMetadata:v58];
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v83 objects:v92 count:16];
          }
          while (v53);
        }

        id v5 = v78;
      }

      v60 = [v5 objectForKeyedSubscript:@"delayed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDelayed:", objc_msgSend(v60, "BOOLValue"));
      }

      if (a3) {
        v61 = @"correctedFlag";
      }
      else {
        v61 = @"corrected_flag";
      }
      v62 = [v5 objectForKeyedSubscript:v61];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v63 = v62;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v79 objects:v91 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v80;
          do
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v80 != v66) {
                objc_enumerationMutation(v63);
              }
              uint64_t v68 = *(void *)(*((void *)&v79 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v69 = [GEORPCorrectedFlag alloc];
                if (a3) {
                  uint64_t v70 = [(GEORPCorrectedFlag *)v69 initWithJSON:v68];
                }
                else {
                  uint64_t v70 = [(GEORPCorrectedFlag *)v69 initWithDictionary:v68];
                }
                long long v71 = (void *)v70;
                [a1 addCorrectedFlag:v70];
              }
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v79 objects:v91 count:16];
          }
          while (v65);
        }

        id v5 = v78;
      }

      if (a3) {
        long long v72 = @"merchantLookupCorrections";
      }
      else {
        long long v72 = @"merchant_lookup_corrections";
      }
      long long v73 = [v5 objectForKeyedSubscript:v72];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v74 = [GEORPMerchantLookupCorrections alloc];
        if (a3) {
          uint64_t v75 = [(GEORPMerchantLookupCorrections *)v74 initWithJSON:v73];
        }
        else {
          uint64_t v75 = [(GEORPMerchantLookupCorrections *)v74 initWithDictionary:v73];
        }
        v76 = (void *)v75;
        [a1 setMerchantLookupCorrections:v75];
      }
    }
  }

  return a1;
}

- (GEORPProblemCorrections)initWithJSON:(id)a3
{
  return (GEORPProblemCorrections *)-[GEORPProblemCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_2684;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2685;
    }
    GEORPProblemCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPProblemCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemCorrectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPProblemCorrections *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->_correctedFields;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    if (self->_correctedLabel) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_correctedCoordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_correctedSearch) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_correctedMapLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_comments) {
      PBDataWriterWriteStringField();
    }
    if (self->_placeProblem) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsProblem) {
      PBDataWriterWriteSubmessage();
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_photoWithMetadatas;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_correctedFlags;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    if (self->_merchantLookupCorrections) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPProblemCorrections _readCorrectedCoordinate]((uint64_t)self);
  if ([(GEORPCorrectedCoordinate *)self->_correctedCoordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemCorrections _readCorrectedLabel]((uint64_t)self);
  if ([(GEORPCorrectedLabel *)self->_correctedLabel hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemCorrections _readCorrectedMapLocation]((uint64_t)self);
  if ([(GEORPMapLocation *)self->_correctedMapLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemCorrections _readCorrectedSearch]((uint64_t)self);
  if ([(GEORPCorrectedSearch *)self->_correctedSearch hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemCorrections _readDirectionsProblem]((uint64_t)self);
  if ([(GEORPDirectionsProblem *)self->_directionsProblem hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemCorrections _readPhotoWithMetadatas]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_photoWithMetadatas;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_18:

  return v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEORPProblemCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 26) = self->_readerMarkPos;
  *((_DWORD *)v16 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPProblemCorrections *)self correctedFieldsCount])
  {
    [v16 clearCorrectedFields];
    unint64_t v4 = [(GEORPProblemCorrections *)self correctedFieldsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPProblemCorrections *)self correctedFieldAtIndex:i];
        [v16 addCorrectedField:v7];
      }
    }
  }
  if (self->_correctedLabel) {
    objc_msgSend(v16, "setCorrectedLabel:");
  }
  if (self->_correctedCoordinate) {
    objc_msgSend(v16, "setCorrectedCoordinate:");
  }
  if (self->_correctedSearch) {
    objc_msgSend(v16, "setCorrectedSearch:");
  }
  if (self->_correctedMapLocation) {
    objc_msgSend(v16, "setCorrectedMapLocation:");
  }
  if (self->_comments) {
    objc_msgSend(v16, "setComments:");
  }
  if (self->_placeProblem) {
    objc_msgSend(v16, "setPlaceProblem:");
  }
  if (self->_directionsProblem) {
    objc_msgSend(v16, "setDirectionsProblem:");
  }
  if ([(GEORPProblemCorrections *)self photoWithMetadatasCount])
  {
    [v16 clearPhotoWithMetadatas];
    unint64_t v8 = [(GEORPProblemCorrections *)self photoWithMetadatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPProblemCorrections *)self photoWithMetadataAtIndex:j];
        [v16 addPhotoWithMetadata:v11];
      }
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    *((unsigned char *)v16 + 116) = self->_delayed;
    *((_WORD *)v16 + 60) |= 1u;
  }
  if ([(GEORPProblemCorrections *)self correctedFlagsCount])
  {
    [v16 clearCorrectedFlags];
    unint64_t v12 = [(GEORPProblemCorrections *)self correctedFlagsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        long long v15 = [(GEORPProblemCorrections *)self correctedFlagAtIndex:k];
        [v16 addCorrectedFlag:v15];
      }
    }
  }
  if (self->_merchantLookupCorrections) {
    objc_msgSend(v16, "setMerchantLookupCorrections:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemCorrections *)self readAll:0];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unint64_t v9 = self->_correctedFields;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCorrectedField:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v10);
  }

  id v14 = [(GEORPCorrectedLabel *)self->_correctedLabel copyWithZone:a3];
  long long v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  id v16 = [(GEORPCorrectedCoordinate *)self->_correctedCoordinate copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  id v18 = [(GEORPCorrectedSearch *)self->_correctedSearch copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  id v20 = [(GEORPMapLocation *)self->_correctedMapLocation copyWithZone:a3];
  long long v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_comments copyWithZone:a3];
  long long v23 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v22;

  id v24 = [(GEORPPlaceProblem *)self->_placeProblem copyWithZone:a3];
  long long v25 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v24;

  id v26 = [(GEORPDirectionsProblem *)self->_directionsProblem copyWithZone:a3];
  long long v27 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v26;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v28 = self->_photoWithMetadatas;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v28);
        }
        v32 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addPhotoWithMetadata:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v29);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 116) = self->_delayed;
    *(_WORD *)(v5 + 120) |= 1u;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v33 = self->_correctedFlags;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v33);
        }
        v37 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * k), "copyWithZone:", a3, (void)v40);
        [(id)v5 addCorrectedFlag:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v34);
  }

  id v38 = [(GEORPMerchantLookupCorrections *)self->_merchantLookupCorrections copyWithZone:a3];
  id v8 = *(id *)(v5 + 80);
  *(void *)(v5 + 80) = v38;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  [(GEORPProblemCorrections *)self readAll:1];
  [v4 readAll:1];
  correctedFields = self->_correctedFields;
  if ((unint64_t)correctedFields | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](correctedFields, "isEqual:")) {
      goto LABEL_32;
    }
  }
  correctedLabel = self->_correctedLabel;
  if ((unint64_t)correctedLabel | *((void *)v4 + 6))
  {
    if (!-[GEORPCorrectedLabel isEqual:](correctedLabel, "isEqual:")) {
      goto LABEL_32;
    }
  }
  correctedCoordinate = self->_correctedCoordinate;
  if ((unint64_t)correctedCoordinate | *((void *)v4 + 3))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](correctedCoordinate, "isEqual:")) {
      goto LABEL_32;
    }
  }
  correctedSearch = self->_correctedSearch;
  if ((unint64_t)correctedSearch | *((void *)v4 + 8))
  {
    if (!-[GEORPCorrectedSearch isEqual:](correctedSearch, "isEqual:")) {
      goto LABEL_32;
    }
  }
  correctedMapLocation = self->_correctedMapLocation;
  if ((unint64_t)correctedMapLocation | *((void *)v4 + 7))
  {
    if (!-[GEORPMapLocation isEqual:](correctedMapLocation, "isEqual:")) {
      goto LABEL_32;
    }
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](comments, "isEqual:")) {
      goto LABEL_32;
    }
  }
  placeProblem = self->_placeProblem;
  if ((unint64_t)placeProblem | *((void *)v4 + 12))
  {
    if (!-[GEORPPlaceProblem isEqual:](placeProblem, "isEqual:")) {
      goto LABEL_32;
    }
  }
  directionsProblem = self->_directionsProblem;
  if ((unint64_t)directionsProblem | *((void *)v4 + 9))
  {
    if (!-[GEORPDirectionsProblem isEqual:](directionsProblem, "isEqual:")) {
      goto LABEL_32;
    }
  }
  photoWithMetadatas = self->_photoWithMetadatas;
  if ((unint64_t)photoWithMetadatas | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](photoWithMetadatas, "isEqual:")) {
      goto LABEL_32;
    }
  }
  __int16 v14 = *((_WORD *)v4 + 60);
  if (*(_WORD *)&self->_flags)
  {
    if (v14)
    {
      if (self->_delayed)
      {
        if (!*((unsigned char *)v4 + 116)) {
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_28;
      }
    }
LABEL_32:
    char v17 = 0;
    goto LABEL_33;
  }
  if (v14) {
    goto LABEL_32;
  }
LABEL_28:
  correctedFlags = self->_correctedFlags;
  if ((unint64_t)correctedFlags | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](correctedFlags, "isEqual:"))
  {
    goto LABEL_32;
  }
  merchantLookupCorrections = self->_merchantLookupCorrections;
  if ((unint64_t)merchantLookupCorrections | *((void *)v4 + 10)) {
    char v17 = -[GEORPMerchantLookupCorrections isEqual:](merchantLookupCorrections, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_33:

  return v17;
}

- (unint64_t)hash
{
  [(GEORPProblemCorrections *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_correctedFields hash];
  unint64_t v4 = [(GEORPCorrectedLabel *)self->_correctedLabel hash];
  unint64_t v5 = [(GEORPCorrectedCoordinate *)self->_correctedCoordinate hash];
  unint64_t v6 = [(GEORPCorrectedSearch *)self->_correctedSearch hash];
  unint64_t v7 = [(GEORPMapLocation *)self->_correctedMapLocation hash];
  NSUInteger v8 = [(NSString *)self->_comments hash];
  unint64_t v9 = [(GEORPPlaceProblem *)self->_placeProblem hash];
  unint64_t v10 = [(GEORPDirectionsProblem *)self->_directionsProblem hash];
  uint64_t v11 = [(NSMutableArray *)self->_photoWithMetadatas hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_delayed;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_correctedFlags hash];
  return v13 ^ [(GEORPMerchantLookupCorrections *)self->_merchantLookupCorrections hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORPProblemCorrections *)self addCorrectedField:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v7);
  }

  correctedLabel = self->_correctedLabel;
  uint64_t v11 = *((void *)v4 + 6);
  if (correctedLabel)
  {
    if (v11) {
      -[GEORPCorrectedLabel mergeFrom:](correctedLabel, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPProblemCorrections setCorrectedLabel:](self, "setCorrectedLabel:");
  }
  correctedCoordinate = self->_correctedCoordinate;
  uint64_t v13 = *((void *)v4 + 3);
  if (correctedCoordinate)
  {
    if (v13) {
      -[GEORPCorrectedCoordinate mergeFrom:](correctedCoordinate, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPProblemCorrections setCorrectedCoordinate:](self, "setCorrectedCoordinate:");
  }
  correctedSearch = self->_correctedSearch;
  uint64_t v15 = *((void *)v4 + 8);
  if (correctedSearch)
  {
    if (v15) {
      -[GEORPCorrectedSearch mergeFrom:](correctedSearch, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPProblemCorrections setCorrectedSearch:](self, "setCorrectedSearch:");
  }
  correctedMapLocation = self->_correctedMapLocation;
  uint64_t v17 = *((void *)v4 + 7);
  if (correctedMapLocation)
  {
    if (v17) {
      -[GEORPMapLocation mergeFrom:](correctedMapLocation, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPProblemCorrections setCorrectedMapLocation:](self, "setCorrectedMapLocation:");
  }
  if (*((void *)v4 + 2)) {
    -[GEORPProblemCorrections setComments:](self, "setComments:");
  }
  placeProblem = self->_placeProblem;
  uint64_t v19 = *((void *)v4 + 12);
  if (placeProblem)
  {
    if (v19) {
      -[GEORPPlaceProblem mergeFrom:](placeProblem, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEORPProblemCorrections setPlaceProblem:](self, "setPlaceProblem:");
  }
  directionsProblem = self->_directionsProblem;
  uint64_t v21 = *((void *)v4 + 9);
  if (directionsProblem)
  {
    if (v21) {
      -[GEORPDirectionsProblem mergeFrom:](directionsProblem, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEORPProblemCorrections setDirectionsProblem:](self, "setDirectionsProblem:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = *((id *)v4 + 11);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        [(GEORPProblemCorrections *)self addPhotoWithMetadata:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v24);
  }

  if (*((_WORD *)v4 + 60))
  {
    self->_delayed = *((unsigned char *)v4 + 116);
    *(_WORD *)&self->_flags |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v27 = *((id *)v4 + 5);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        -[GEORPProblemCorrections addCorrectedFlag:](self, "addCorrectedFlag:", *(void *)(*((void *)&v34 + 1) + 8 * k), (void)v34);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v29);
  }

  merchantLookupCorrections = self->_merchantLookupCorrections;
  uint64_t v33 = *((void *)v4 + 10);
  if (merchantLookupCorrections)
  {
    if (v33) {
      -[GEORPMerchantLookupCorrections mergeFrom:](merchantLookupCorrections, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEORPProblemCorrections setMerchantLookupCorrections:](self, "setMerchantLookupCorrections:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeProblem, 0);
  objc_storeStrong((id *)&self->_photoWithMetadatas, 0);
  objc_storeStrong((id *)&self->_merchantLookupCorrections, 0);
  objc_storeStrong((id *)&self->_directionsProblem, 0);
  objc_storeStrong((id *)&self->_correctedSearch, 0);
  objc_storeStrong((id *)&self->_correctedMapLocation, 0);
  objc_storeStrong((id *)&self->_correctedLabel, 0);
  objc_storeStrong((id *)&self->_correctedFlags, 0);
  objc_storeStrong((id *)&self->_correctedFields, 0);
  objc_storeStrong((id *)&self->_correctedCoordinate, 0);
  objc_storeStrong((id *)&self->_comments, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end