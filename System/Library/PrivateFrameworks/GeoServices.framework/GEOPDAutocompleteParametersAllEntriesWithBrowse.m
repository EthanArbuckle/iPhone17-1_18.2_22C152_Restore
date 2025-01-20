@interface GEOPDAutocompleteParametersAllEntriesWithBrowse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAutocompleteOriginationInfo;
- (BOOL)hasCategorySuggestionEntry;
- (BOOL)hasCategorySuggestionEntryMetadata;
- (BOOL)hasEvChargingParameters;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightDiff;
- (BOOL)hasInterleaveCategorySuggestions;
- (BOOL)hasMaxQueryBuilderSuggestions;
- (BOOL)hasMaxResults;
- (BOOL)hasPlaceSummaryRevision;
- (BOOL)hasQuery;
- (BOOL)hasQuerySuggestionEntry;
- (BOOL)hasRetainedSearch;
- (BOOL)hasSupportClientRankingCompositeFeatures;
- (BOOL)hasSupportClientRankingFeatureMetadata;
- (BOOL)hasSupportDirectionIntentSuggestions;
- (BOOL)hasSupportRapAffordance;
- (BOOL)hasSupportSectionHeader;
- (BOOL)hasSupportStructuredRapAffordance;
- (BOOL)hasSupportUnresolvedDirectionIntent;
- (BOOL)hasVenueIdentifier;
- (BOOL)hasViewportInfo;
- (BOOL)highlightDiff;
- (BOOL)interleaveCategorySuggestions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportClientRankingCompositeFeatures;
- (BOOL)supportClientRankingFeatureMetadata;
- (BOOL)supportDirectionIntentSuggestions;
- (BOOL)supportRapAffordance;
- (BOOL)supportSectionHeader;
- (BOOL)supportStructuredRapAffordance;
- (BOOL)supportUnresolvedDirectionIntent;
- (GEOPDAutocompleteEntry)categorySuggestionEntry;
- (GEOPDAutocompleteEntry)querySuggestionEntry;
- (GEOPDAutocompleteOriginationInfo)autocompleteOriginationInfo;
- (GEOPDAutocompleteParametersAllEntriesWithBrowse)init;
- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithData:(id)a3;
- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithDictionary:(id)a3;
- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithJSON:(id)a3;
- (GEOPDRetainedSearchMetadata)retainedSearch;
- (GEOPDSSearchEvChargingParameters)evChargingParameters;
- (GEOPDVenueIdentifier)venueIdentifier;
- (GEOPDViewportInfo)viewportInfo;
- (NSData)categorySuggestionEntryMetadata;
- (NSString)query;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)knownRefinementTypesAsString:(int)a3;
- (id)placeSummaryRevisionAsString:(int)a3;
- (id)supportedAutocompleteResultCellTypesAsString:(int)a3;
- (id)supportedHighlightTypesAsString:(int)a3;
- (id)supportedListTypesAsString:(int)a3;
- (id)supportedPlaceSummaryFormatTypesAsString:(int)a3;
- (int)StringAsKnownRefinementTypes:(id)a3;
- (int)StringAsPlaceSummaryRevision:(id)a3;
- (int)StringAsSupportedAutocompleteResultCellTypes:(id)a3;
- (int)StringAsSupportedHighlightTypes:(id)a3;
- (int)StringAsSupportedListTypes:(id)a3;
- (int)StringAsSupportedPlaceSummaryFormatTypes:(id)a3;
- (int)knownRefinementTypeAtIndex:(unint64_t)a3;
- (int)knownRefinementTypes;
- (int)maxQueryBuilderSuggestions;
- (int)maxResults;
- (int)placeSummaryRevision;
- (int)supportedAutocompleteResultCellTypeAtIndex:(unint64_t)a3;
- (int)supportedAutocompleteResultCellTypes;
- (int)supportedHighlightTypeAtIndex:(unint64_t)a3;
- (int)supportedHighlightTypes;
- (int)supportedListTypeAtIndex:(unint64_t)a3;
- (int)supportedListTypes;
- (int)supportedPlaceSummaryFormatTypeAtIndex:(unint64_t)a3;
- (int)supportedPlaceSummaryFormatTypes;
- (unint64_t)hash;
- (unint64_t)knownRefinementTypesCount;
- (unint64_t)supportedAutocompleteResultCellTypesCount;
- (unint64_t)supportedHighlightTypesCount;
- (unint64_t)supportedListTypesCount;
- (unint64_t)supportedPlaceSummaryFormatTypesCount;
- (void)_readAutocompleteOriginationInfo;
- (void)_readCategorySuggestionEntry;
- (void)_readCategorySuggestionEntryMetadata;
- (void)_readEvChargingParameters;
- (void)_readKnownRefinementTypes;
- (void)_readQuery;
- (void)_readQuerySuggestionEntry;
- (void)_readRetainedSearch;
- (void)_readSupportedAutocompleteResultCellTypes;
- (void)_readSupportedHighlightTypes;
- (void)_readSupportedListTypes;
- (void)_readSupportedPlaceSummaryFormatTypes;
- (void)_readVenueIdentifier;
- (void)_readViewportInfo;
- (void)addKnownRefinementType:(int)a3;
- (void)addSupportedAutocompleteResultCellType:(int)a3;
- (void)addSupportedHighlightType:(int)a3;
- (void)addSupportedListType:(int)a3;
- (void)addSupportedPlaceSummaryFormatType:(int)a3;
- (void)clearKnownRefinementTypes;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSupportedAutocompleteResultCellTypes;
- (void)clearSupportedHighlightTypes;
- (void)clearSupportedListTypes;
- (void)clearSupportedPlaceSummaryFormatTypes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteOriginationInfo:(id)a3;
- (void)setCategorySuggestionEntry:(id)a3;
- (void)setCategorySuggestionEntryMetadata:(id)a3;
- (void)setEvChargingParameters:(id)a3;
- (void)setHasHighlightDiff:(BOOL)a3;
- (void)setHasInterleaveCategorySuggestions:(BOOL)a3;
- (void)setHasMaxQueryBuilderSuggestions:(BOOL)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setHasPlaceSummaryRevision:(BOOL)a3;
- (void)setHasSupportClientRankingCompositeFeatures:(BOOL)a3;
- (void)setHasSupportClientRankingFeatureMetadata:(BOOL)a3;
- (void)setHasSupportDirectionIntentSuggestions:(BOOL)a3;
- (void)setHasSupportRapAffordance:(BOOL)a3;
- (void)setHasSupportSectionHeader:(BOOL)a3;
- (void)setHasSupportStructuredRapAffordance:(BOOL)a3;
- (void)setHasSupportUnresolvedDirectionIntent:(BOOL)a3;
- (void)setHighlightDiff:(BOOL)a3;
- (void)setInterleaveCategorySuggestions:(BOOL)a3;
- (void)setKnownRefinementTypes:(int *)a3 count:(unint64_t)a4;
- (void)setMaxQueryBuilderSuggestions:(int)a3;
- (void)setMaxResults:(int)a3;
- (void)setPlaceSummaryRevision:(int)a3;
- (void)setQuery:(id)a3;
- (void)setQuerySuggestionEntry:(id)a3;
- (void)setRetainedSearch:(id)a3;
- (void)setSupportClientRankingCompositeFeatures:(BOOL)a3;
- (void)setSupportClientRankingFeatureMetadata:(BOOL)a3;
- (void)setSupportDirectionIntentSuggestions:(BOOL)a3;
- (void)setSupportRapAffordance:(BOOL)a3;
- (void)setSupportSectionHeader:(BOOL)a3;
- (void)setSupportStructuredRapAffordance:(BOOL)a3;
- (void)setSupportUnresolvedDirectionIntent:(BOOL)a3;
- (void)setSupportedAutocompleteResultCellTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedHighlightTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedListTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedPlaceSummaryFormatTypes:(int *)a3 count:(unint64_t)a4;
- (void)setVenueIdentifier:(id)a3;
- (void)setViewportInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteParametersAllEntriesWithBrowse

- (void)copyTo:(id)a3
{
  v23 = (id *)a3;
  [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v23 + 1, self->_reader);
  *((_DWORD *)v23 + 54) = self->_readerMarkPos;
  *((_DWORD *)v23 + 55) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v23, "setQuery:");
  }
  if (self->_viewportInfo) {
    objc_msgSend(v23, "setViewportInfo:");
  }
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  v5 = v23;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v23 + 58) = self->_maxResults;
    *((_DWORD *)v23 + 63) |= 2u;
    $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((unsigned char *)v23 + 240) = self->_highlightDiff;
    *((_DWORD *)v23 + 63) |= 8u;
  }
  if (self->_categorySuggestionEntryMetadata)
  {
    objc_msgSend(v23, "setCategorySuggestionEntryMetadata:");
    v5 = v23;
  }
  if (self->_categorySuggestionEntry)
  {
    objc_msgSend(v23, "setCategorySuggestionEntry:");
    v5 = v23;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((unsigned char *)v5 + 241) = self->_interleaveCategorySuggestions;
    *((_DWORD *)v5 + 63) |= 0x10u;
  }
  if (self->_venueIdentifier)
  {
    objc_msgSend(v23, "setVenueIdentifier:");
    v5 = v23;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *((unsigned char *)v5 + 244) = self->_supportDirectionIntentSuggestions;
    *((_DWORD *)v5 + 63) |= 0x80u;
  }
  if (self->_retainedSearch)
  {
    objc_msgSend(v23, "setRetainedSearch:");
    v5 = v23;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *((unsigned char *)v5 + 248) = self->_supportUnresolvedDirectionIntent;
    *((_DWORD *)v5 + 63) |= 0x800u;
  }
  if ([(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedListTypesCount])
  {
    [v23 clearSupportedListTypes];
    unint64_t v6 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedListTypesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v23, "addSupportedListType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedListTypeAtIndex:](self, "supportedListTypeAtIndex:", i));
    }
  }
  if (self->_querySuggestionEntry) {
    objc_msgSend(v23, "setQuerySuggestionEntry:");
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v9 & 1) == 0) {
      goto LABEL_31;
    }
LABEL_65:
    *((_DWORD *)v23 + 57) = self->_maxQueryBuilderSuggestions;
    *((_DWORD *)v23 + 63) |= 1u;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  *((unsigned char *)v23 + 243) = self->_supportClientRankingFeatureMetadata;
  *((_DWORD *)v23 + 63) |= 0x40u;
  $EAFDE4515419465CA71EC8A4C4CE129B v9 = self->_flags;
  if (*(unsigned char *)&v9) {
    goto LABEL_65;
  }
LABEL_31:
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
LABEL_32:
    *((unsigned char *)v23 + 246) = self->_supportSectionHeader;
    *((_DWORD *)v23 + 63) |= 0x200u;
  }
LABEL_33:
  if ([(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedAutocompleteResultCellTypesCount])
  {
    [v23 clearSupportedAutocompleteResultCellTypes];
    unint64_t v10 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedAutocompleteResultCellTypesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v23, "addSupportedAutocompleteResultCellType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedAutocompleteResultCellTypeAtIndex:](self, "supportedAutocompleteResultCellTypeAtIndex:", j));
    }
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((unsigned char *)v23 + 245) = self->_supportRapAffordance;
    *((_DWORD *)v23 + 63) |= 0x100u;
  }
  if ([(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self knownRefinementTypesCount])
  {
    [v23 clearKnownRefinementTypes];
    unint64_t v13 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self knownRefinementTypesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        objc_msgSend(v23, "addKnownRefinementType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse knownRefinementTypeAtIndex:](self, "knownRefinementTypeAtIndex:", k));
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v23 + 59) = self->_placeSummaryRevision;
    *((_DWORD *)v23 + 63) |= 4u;
  }
  if ([(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedPlaceSummaryFormatTypesCount])
  {
    [v23 clearSupportedPlaceSummaryFormatTypes];
    unint64_t v16 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedPlaceSummaryFormatTypesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        objc_msgSend(v23, "addSupportedPlaceSummaryFormatType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedPlaceSummaryFormatTypeAtIndex:](self, "supportedPlaceSummaryFormatTypeAtIndex:", m));
    }
  }
  if (self->_evChargingParameters) {
    objc_msgSend(v23, "setEvChargingParameters:");
  }
  if ([(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedHighlightTypesCount])
  {
    [v23 clearSupportedHighlightTypes];
    unint64_t v19 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self supportedHighlightTypesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        objc_msgSend(v23, "addSupportedHighlightType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedHighlightTypeAtIndex:](self, "supportedHighlightTypeAtIndex:", n));
    }
  }
  if (self->_autocompleteOriginationInfo) {
    objc_msgSend(v23, "setAutocompleteOriginationInfo:");
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v22 = self->_flags;
  if ((*(unsigned char *)&v22 & 0x20) != 0)
  {
    *((unsigned char *)v23 + 242) = self->_supportClientRankingCompositeFeatures;
    *((_DWORD *)v23 + 63) |= 0x20u;
    $EAFDE4515419465CA71EC8A4C4CE129B v22 = self->_flags;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    *((unsigned char *)v23 + 247) = self->_supportStructuredRapAffordance;
    *((_DWORD *)v23 + 63) |= 0x400u;
  }
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  v2 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  v3 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)&v3 dealloc];
}

- (void)_readQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_976);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8800000u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 255) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_977);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasViewportInfo
{
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC000000u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (int)maxResults
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_maxResults;
  }
  else {
    return 15;
  }
}

- (void)setMaxResults:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x8000002u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  if (a3) {
    int v3 = 134217730;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasMaxResults
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)highlightDiff
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 8) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000008u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  if (a3) {
    int v3 = 134217736;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHighlightDiff
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readCategorySuggestionEntryMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorySuggestionEntryMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasCategorySuggestionEntryMetadata
{
  return self->_categorySuggestionEntryMetadata != 0;
}

- (NSData)categorySuggestionEntryMetadata
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntryMetadata]((uint64_t)self);
  categorySuggestionEntryMetadata = self->_categorySuggestionEntryMetadata;

  return categorySuggestionEntryMetadata;
}

- (void)setCategorySuggestionEntryMetadata:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8080000u;
  objc_storeStrong((id *)&self->_categorySuggestionEntryMetadata, a3);
}

- (void)_readCategorySuggestionEntry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorySuggestionEntry_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasCategorySuggestionEntry
{
  return self->_categorySuggestionEntry != 0;
}

- (GEOPDAutocompleteEntry)categorySuggestionEntry
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntry]((uint64_t)self);
  categorySuggestionEntry = self->_categorySuggestionEntry;

  return categorySuggestionEntry;
}

- (void)setCategorySuggestionEntry:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8100000u;
  objc_storeStrong((id *)&self->_categorySuggestionEntry, a3);
}

- (BOOL)interleaveCategorySuggestions
{
  return self->_interleaveCategorySuggestions;
}

- (void)setInterleaveCategorySuggestions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000010u;
  self->_interleaveCategorySuggestions = a3;
}

- (void)setHasInterleaveCategorySuggestions:(BOOL)a3
{
  if (a3) {
    int v3 = 134217744;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasInterleaveCategorySuggestions
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readVenueIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 255) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasVenueIdentifier
{
  return self->_venueIdentifier != 0;
}

- (GEOPDVenueIdentifier)venueIdentifier
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readVenueIdentifier]((uint64_t)self);
  venueIdentifier = self->_venueIdentifier;

  return venueIdentifier;
}

- (void)setVenueIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA000000u;
  objc_storeStrong((id *)&self->_venueIdentifier, a3);
}

- (BOOL)supportDirectionIntentSuggestions
{
  return self->_supportDirectionIntentSuggestions;
}

- (void)setSupportDirectionIntentSuggestions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000080u;
  self->_supportDirectionIntentSuggestions = a3;
}

- (void)setHasSupportDirectionIntentSuggestions:(BOOL)a3
{
  if (a3) {
    int v3 = 134217856;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasSupportDirectionIntentSuggestions
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readRetainedSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 255) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRetainedSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasRetainedSearch
{
  return self->_retainedSearch != 0;
}

- (GEOPDRetainedSearchMetadata)retainedSearch
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readRetainedSearch]((uint64_t)self);
  retainedSearch = self->_retainedSearch;

  return retainedSearch;
}

- (void)setRetainedSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x9000000u;
  objc_storeStrong((id *)&self->_retainedSearch, a3);
}

- (BOOL)supportUnresolvedDirectionIntent
{
  return self->_supportUnresolvedDirectionIntent;
}

- (void)setSupportUnresolvedDirectionIntent:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000800u;
  self->_supportUnresolvedDirectionIntent = a3;
}

- (void)setHasSupportUnresolvedDirectionIntent:(BOOL)a3
{
  if (a3) {
    int v3 = 134219776;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xF7FFF7FF | v3);
}

- (BOOL)hasSupportUnresolvedDirectionIntent
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readSupportedListTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedListTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedListTypesCount
{
  return self->_supportedListTypes.count;
}

- (int)supportedListTypes
{
  return self->_supportedListTypes.list;
}

- (void)clearSupportedListTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  PBRepeatedInt32Clear();
}

- (void)addSupportedListType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedListTypeAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedListTypes]((uint64_t)self);
  p_supportedListTypes = &self->_supportedListTypes;
  unint64_t count = self->_supportedListTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedListTypes->list[a3];
}

- (void)setSupportedListTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  MEMORY[0x1F4147390](&self->_supportedListTypes, a3, a4);
}

- (id)supportedListTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DC6D0[a3];
  }

  return v3;
}

- (int)StringAsSupportedListTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERLEAVED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SECTION_ONLY_FOR_QUERY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readQuerySuggestionEntry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuerySuggestionEntry_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasQuerySuggestionEntry
{
  return self->_querySuggestionEntry != 0;
}

- (GEOPDAutocompleteEntry)querySuggestionEntry
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuerySuggestionEntry]((uint64_t)self);
  querySuggestionEntry = self->_querySuggestionEntry;

  return querySuggestionEntry;
}

- (void)setQuerySuggestionEntry:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8400000u;
  objc_storeStrong((id *)&self->_querySuggestionEntry, a3);
}

- (BOOL)supportClientRankingFeatureMetadata
{
  return self->_supportClientRankingFeatureMetadata;
}

- (void)setSupportClientRankingFeatureMetadata:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000040u;
  self->_supportClientRankingFeatureMetadata = a3;
}

- (void)setHasSupportClientRankingFeatureMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 134217792;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSupportClientRankingFeatureMetadata
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)maxQueryBuilderSuggestions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_maxQueryBuilderSuggestions;
  }
  else {
    return 5;
  }
}

- (void)setMaxQueryBuilderSuggestions:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x8000001u;
  self->_maxQueryBuilderSuggestions = a3;
}

- (void)setHasMaxQueryBuilderSuggestions:(BOOL)a3
{
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x8000000);
}

- (BOOL)hasMaxQueryBuilderSuggestions
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)supportSectionHeader
{
  return self->_supportSectionHeader;
}

- (void)setSupportSectionHeader:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000200u;
  self->_supportSectionHeader = a3;
}

- (void)setHasSupportSectionHeader:(BOOL)a3
{
  if (a3) {
    int v3 = 134218240;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasSupportSectionHeader
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readSupportedAutocompleteResultCellTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 253) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedAutocompleteResultCellTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedAutocompleteResultCellTypesCount
{
  return self->_supportedAutocompleteResultCellTypes.count;
}

- (int)supportedAutocompleteResultCellTypes
{
  return self->_supportedAutocompleteResultCellTypes.list;
}

- (void)clearSupportedAutocompleteResultCellTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  PBRepeatedInt32Clear();
}

- (void)addSupportedAutocompleteResultCellType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedAutocompleteResultCellTypeAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  p_supportedAutocompleteResultCellTypes = &self->_supportedAutocompleteResultCellTypes;
  unint64_t count = self->_supportedAutocompleteResultCellTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedAutocompleteResultCellTypes->list[a3];
}

- (void)setSupportedAutocompleteResultCellTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  MEMORY[0x1F4147390](&self->_supportedAutocompleteResultCellTypes, a3, a4);
}

- (id)supportedAutocompleteResultCellTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DC6E8[a3];
  }

  return v3;
}

- (int)StringAsSupportedAutocompleteResultCellTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportRapAffordance
{
  return self->_supportRapAffordance;
}

- (void)setSupportRapAffordance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000100u;
  self->_supportRapAffordance = a3;
}

- (void)setHasSupportRapAffordance:(BOOL)a3
{
  if (a3) {
    int v3 = 134217984;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasSupportRapAffordance
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readKnownRefinementTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 253) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)knownRefinementTypesCount
{
  return self->_knownRefinementTypes.count;
}

- (int)knownRefinementTypes
{
  return self->_knownRefinementTypes.list;
}

- (void)clearKnownRefinementTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  PBRepeatedInt32Clear();
}

- (void)addKnownRefinementType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)knownRefinementTypeAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readKnownRefinementTypes]((uint64_t)self);
  p_knownRefinementTypes = &self->_knownRefinementTypes;
  unint64_t count = self->_knownRefinementTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_knownRefinementTypes->list[a3];
}

- (void)setKnownRefinementTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  MEMORY[0x1F4147390](&self->_knownRefinementTypes, a3, a4);
}

- (id)knownRefinementTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DCF98[a3];
  }

  return v3;
}

- (int)StringAsKnownRefinementTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESULT_REFINEMENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_TYPE_TOGGLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_TYPE_RANGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_TYPE_MULTI_SELECT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_TYPE_SORT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)placeSummaryRevision
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 4) != 0) {
    return self->_placeSummaryRevision;
  }
  else {
    return 0;
  }
}

- (void)setPlaceSummaryRevision:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x8000004u;
  self->_placeSummaryRevisiouint64_t n = a3;
}

- (void)setHasPlaceSummaryRevision:(BOOL)a3
{
  if (a3) {
    int v3 = 134217732;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasPlaceSummaryRevision
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)placeSummaryRevisionAsString:(int)a3
{
  if (a3 >= 0x24)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DCFD0[a3];
  }

  return v3;
}

- (int)StringAsPlaceSummaryRevision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISTANCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PRICE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HOURS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RATINGS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SHIELDS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"USER_GENERATED_GUIDES"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CURATED_GUIDES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"EV_CHARGERS_NUMBER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"STRING"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SERVER_OVERRIDE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONTAINMENT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RECENT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHT_MAIN"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHT_EXTRA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_DESCRIPTION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SECONDARY_NAME"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FACTOID"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ARP_RATINGS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"DETOUR_TIME"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"HIKING_DIFFICULTY"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"HIKING_TRAIL_LENGTH"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"PHOTO_CAROUSEL"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"IN_USER_LIBRARY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"USER_NOTE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_DURATION"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_LENGTH"])
  {
    int v4 = 35;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedPlaceSummaryFormatTypesCount
{
  return self->_supportedPlaceSummaryFormatTypes.count;
}

- (int)supportedPlaceSummaryFormatTypes
{
  return self->_supportedPlaceSummaryFormatTypes.list;
}

- (void)clearSupportedPlaceSummaryFormatTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  PBRepeatedInt32Clear();
}

- (void)addSupportedPlaceSummaryFormatType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedPlaceSummaryFormatTypeAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  p_supportedPlaceSummaryFormatTypes = &self->_supportedPlaceSummaryFormatTypes;
  unint64_t count = self->_supportedPlaceSummaryFormatTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedPlaceSummaryFormatTypes->list[a3];
}

- (void)setSupportedPlaceSummaryFormatTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  MEMORY[0x1F4147390](&self->_supportedPlaceSummaryFormatTypes, a3, a4);
}

- (id)supportedPlaceSummaryFormatTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DD0F0[a3];
  }

  return v3;
}

- (int)StringAsSupportedPlaceSummaryFormatTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_BOLD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_ITALICS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readEvChargingParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasEvChargingParameters
{
  return self->_evChargingParameters != 0;
}

- (GEOPDSSearchEvChargingParameters)evChargingParameters
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readEvChargingParameters]((uint64_t)self);
  evChargingParameters = self->_evChargingParameters;

  return evChargingParameters;
}

- (void)setEvChargingParameters:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8200000u;
  objc_storeStrong((id *)&self->_evChargingParameters, a3);
}

- (void)_readSupportedHighlightTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 253) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedHighlightTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedHighlightTypesCount
{
  return self->_supportedHighlightTypes.count;
}

- (int)supportedHighlightTypes
{
  return self->_supportedHighlightTypes.list;
}

- (void)clearSupportedHighlightTypes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  PBRepeatedInt32Clear();
}

- (void)addSupportedHighlightType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedHighlightTypeAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedHighlightTypes]((uint64_t)self);
  p_supportedHighlightTypes = &self->_supportedHighlightTypes;
  unint64_t count = self->_supportedHighlightTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedHighlightTypes->list[a3];
}

- (void)setSupportedHighlightTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;

  MEMORY[0x1F4147390](&self->_supportedHighlightTypes, a3, a4);
}

- (id)supportedHighlightTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DC748[a3];
  }

  return v3;
}

- (int)StringAsSupportedHighlightTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_BOLD_HIGHLIGHT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY_INVERSE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAutocompleteOriginationInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(unsigned char *)(a1 + 254) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteOriginationInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasAutocompleteOriginationInfo
{
  return self->_autocompleteOriginationInfo != 0;
}

- (GEOPDAutocompleteOriginationInfo)autocompleteOriginationInfo
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readAutocompleteOriginationInfo]((uint64_t)self);
  autocompleteOriginationInfo = self->_autocompleteOriginationInfo;

  return autocompleteOriginationInfo;
}

- (void)setAutocompleteOriginationInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8040000u;
  objc_storeStrong((id *)&self->_autocompleteOriginationInfo, a3);
}

- (BOOL)supportClientRankingCompositeFeatures
{
  return self->_supportClientRankingCompositeFeatures;
}

- (void)setSupportClientRankingCompositeFeatures:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000020u;
  self->_supportClientRankingCompositeFeatures = a3;
}

- (void)setHasSupportClientRankingCompositeFeatures:(BOOL)a3
{
  if (a3) {
    int v3 = 134217760;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasSupportClientRankingCompositeFeatures
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)supportStructuredRapAffordance
{
  return self->_supportStructuredRapAffordance;
}

- (void)setSupportStructuredRapAffordance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000400u;
  self->_supportStructuredRapAffordance = a3;
}

- (void)setHasSupportStructuredRapAffordance:(BOOL)a3
{
  if (a3) {
    int v3 = 134218752;
  }
  else {
    int v3 = 0x8000000;
  }
  self->_$EAFDE4515419465CA71EC8A4C4CE129B flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasSupportStructuredRapAffordance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  int v4 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)&v8 description];
  v5 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersAllEntriesWithBrowse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v109 = 0;
    goto LABEL_167;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 query];
  if (v5) {
    [v4 setObject:v5 forKey:@"query"];
  }

  objc_super v6 = [(id)a1 viewportInfo];
  objc_super v7 = v6;
  if (v6)
  {
    if (a2)
    {
      objc_super v8 = [v6 jsonRepresentation];
      $EAFDE4515419465CA71EC8A4C4CE129B v9 = @"viewportInfo";
    }
    else
    {
      objc_super v8 = [v6 dictionaryRepresentation];
      $EAFDE4515419465CA71EC8A4C4CE129B v9 = @"viewport_info";
    }
    id v10 = v8;

    [v4 setObject:v10 forKey:v9];
  }

  unint64_t v11 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  int v12 = *(_DWORD *)(a1 + 252);
  if ((v12 & 2) != 0)
  {
    unint64_t v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 232)];
    if (a2) {
      unint64_t v14 = @"maxResults";
    }
    else {
      unint64_t v14 = @"max_results";
    }
    [v4 setObject:v13 forKey:v14];

    int v12 = *(_DWORD *)(a1 + 252);
  }
  if ((v12 & 8) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 240)];
    if (a2) {
      unint64_t v16 = @"highlightDiff";
    }
    else {
      unint64_t v16 = @"highlight_diff";
    }
    [v4 setObject:v15 forKey:v16];
  }
  unint64_t v17 = [(id)a1 categorySuggestionEntryMetadata];
  v18 = v17;
  if (v17)
  {
    if (a2)
    {
      unint64_t v19 = [v17 base64EncodedStringWithOptions:0];
      [v4 setObject:v19 forKey:@"categorySuggestionEntryMetadata"];
    }
    else
    {
      [v4 setObject:v17 forKey:@"category_suggestion_entry_metadata"];
    }
  }

  unint64_t v20 = [(id)a1 categorySuggestionEntry];
  v21 = v20;
  if (v20)
  {
    if (a2)
    {
      $EAFDE4515419465CA71EC8A4C4CE129B v22 = [v20 jsonRepresentation];
      v23 = @"categorySuggestionEntry";
    }
    else
    {
      $EAFDE4515419465CA71EC8A4C4CE129B v22 = [v20 dictionaryRepresentation];
      v23 = @"category_suggestion_entry";
    }
    id v24 = v22;

    [v4 setObject:v24 forKey:v23];
  }

  if ((*(unsigned char *)(a1 + 252) & 0x10) != 0)
  {
    v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 241)];
    if (a2) {
      v26 = @"interleaveCategorySuggestions";
    }
    else {
      v26 = @"interleave_category_suggestions";
    }
    [v4 setObject:v25 forKey:v26];
  }
  v27 = [(id)a1 venueIdentifier];
  v28 = v27;
  if (v27)
  {
    if (a2)
    {
      v29 = [v27 jsonRepresentation];
      v30 = @"venueIdentifier";
    }
    else
    {
      v29 = [v27 dictionaryRepresentation];
      v30 = @"venue_identifier";
    }
    id v31 = v29;

    [v4 setObject:v31 forKey:v30];
  }

  if ((*(unsigned char *)(a1 + 252) & 0x80) != 0)
  {
    v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 244)];
    if (a2) {
      v33 = @"supportDirectionIntentSuggestions";
    }
    else {
      v33 = @"support_direction_intent_suggestions";
    }
    [v4 setObject:v32 forKey:v33];
  }
  v34 = [(id)a1 retainedSearch];
  v35 = v34;
  if (v34)
  {
    if (a2)
    {
      v36 = [v34 jsonRepresentation];
      v37 = @"retainedSearch";
    }
    else
    {
      v36 = [v34 dictionaryRepresentation];
      v37 = @"retained_search";
    }
    id v38 = v36;

    [v4 setObject:v38 forKey:v37];
  }

  if ((*(unsigned char *)(a1 + 253) & 8) != 0)
  {
    v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 248)];
    if (a2) {
      v40 = @"supportUnresolvedDirectionIntent";
    }
    else {
      v40 = @"support_unresolved_direction_intent";
    }
    [v4 setObject:v39 forKey:v40];
  }
  if (*(void *)(a1 + 104))
  {
    v41 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v42 = (void *)(a1 + 96);
    if (*(void *)(a1 + 104))
    {
      unint64_t v43 = 0;
      do
      {
        uint64_t v44 = *(int *)(*v42 + 4 * v43);
        if (v44 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v44);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v45 = off_1E53DC6D0[v44];
        }
        [v41 addObject:v45];

        ++v43;
        v42 = (void *)(a1 + 96);
      }
      while (v43 < *(void *)(a1 + 104));
    }
    if (a2) {
      v46 = @"supportedListType";
    }
    else {
      v46 = @"supported_list_type";
    }
    [v4 setObject:v41 forKey:v46];

    unint64_t v11 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  v47 = [(id)a1 querySuggestionEntry];
  v48 = v47;
  if (v47)
  {
    if (a2)
    {
      v49 = [v47 jsonRepresentation];
      v50 = @"querySuggestionEntry";
    }
    else
    {
      v49 = [v47 dictionaryRepresentation];
      v50 = @"query_suggestion_entry";
    }
    id v51 = v49;

    [v4 setObject:v51 forKey:v50];
  }

  int v52 = *(_DWORD *)(a1 + 252);
  if ((v52 & 0x40) == 0)
  {
    if ((v52 & 1) == 0) {
      goto LABEL_71;
    }
LABEL_110:
    v73 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 228)];
    if (a2) {
      v74 = @"maxQueryBuilderSuggestions";
    }
    else {
      v74 = @"max_query_builder_suggestions";
    }
    [v4 setObject:v73 forKey:v74];

    if ((*(_DWORD *)(a1 + 252) & 0x200) == 0) {
      goto LABEL_76;
    }
    goto LABEL_72;
  }
  v71 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 243)];
  if (a2) {
    v72 = @"supportClientRankingFeatureMetadata";
  }
  else {
    v72 = @"support_client_ranking_feature_metadata";
  }
  [v4 setObject:v71 forKey:v72];

  int v52 = *(_DWORD *)(a1 + 252);
  if (v52) {
    goto LABEL_110;
  }
LABEL_71:
  if ((v52 & 0x200) != 0)
  {
LABEL_72:
    v53 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 246)];
    if (a2) {
      v54 = @"supportSectionHeader";
    }
    else {
      v54 = @"support_section_header";
    }
    [v4 setObject:v53 forKey:v54];
  }
LABEL_76:
  if (*(void *)(a1 + 56))
  {
    v55 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v56 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v57 = 0;
      do
      {
        uint64_t v58 = *(int *)(*v56 + 4 * v57);
        if (v58 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v58);
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = off_1E53DC6E8[v58];
        }
        [v55 addObject:v59];

        ++v57;
        v56 = (void *)(a1 + 48);
      }
      while (v57 < *(void *)(a1 + 56));
    }
    if (a2) {
      v60 = @"supportedAutocompleteResultCellType";
    }
    else {
      v60 = @"supported_autocomplete_result_cell_type";
    }
    [v4 setObject:v55 forKey:v60];

    unint64_t v11 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  if (*(unsigned char *)(a1 + 253))
  {
    v61 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 245)];
    if (a2) {
      v62 = @"supportRapAffordance";
    }
    else {
      v62 = @"support_rap_affordance";
    }
    [v4 setObject:v61 forKey:v62];
  }
  if (*(void *)(a1 + 32))
  {
    v63 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v64 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v65 = 0;
      do
      {
        uint64_t v66 = *(int *)(*v64 + 4 * v65);
        if (v66 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v66);
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = off_1E53DCF98[v66];
        }
        [v63 addObject:v67];

        ++v65;
        v64 = (void *)(a1 + 24);
      }
      while (v65 < *(void *)(a1 + 32));
    }
    if (a2) {
      v68 = @"knownRefinementType";
    }
    else {
      v68 = @"known_refinement_type";
    }
    [v4 setObject:v63 forKey:v68];

    unint64_t v11 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  if ((*(unsigned char *)(a1 + 252) & 4) != 0)
  {
    uint64_t v69 = *(int *)(a1 + 236);
    if (v69 >= 0x24)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 236));
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = off_1E53DCFD0[v69];
    }
    if (a2) {
      v75 = @"placeSummaryRevision";
    }
    else {
      v75 = @"place_summary_revision";
    }
    [v4 setObject:v70 forKey:v75];
  }
  if (*(void *)(a1 + 128))
  {
    v76 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v77 = (void *)(a1 + 120);
    if (*(void *)(a1 + 128))
    {
      unint64_t v78 = 0;
      do
      {
        uint64_t v79 = *(int *)(*v77 + 4 * v78);
        if (v79 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v79);
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v80 = off_1E53DD0F0[v79];
        }
        [v76 addObject:v80];

        ++v78;
        v77 = (void *)(a1 + 120);
      }
      while (v78 < *(void *)(a1 + 128));
    }
    if (a2) {
      v81 = @"supportedPlaceSummaryFormatType";
    }
    else {
      v81 = @"supported_place_summary_format_type";
    }
    [v4 setObject:v76 forKey:v81];

    unint64_t v11 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  v82 = [(id)a1 evChargingParameters];
  v83 = v82;
  if (v82)
  {
    if (a2)
    {
      v84 = [v82 jsonRepresentation];
      v85 = @"evChargingParameters";
    }
    else
    {
      v84 = [v82 dictionaryRepresentation];
      v85 = @"ev_charging_parameters";
    }
    id v86 = v84;

    [v4 setObject:v86 forKey:v85];
  }

  if (*(void *)(a1 + 80))
  {
    v87 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v88 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v89 = 0;
      do
      {
        uint64_t v90 = *(int *)(*v88 + 4 * v89);
        if (v90 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v90);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v91 = off_1E53DC748[v90];
        }
        [v87 addObject:v91];

        ++v89;
        v88 = (void *)(a1 + 72);
      }
      while (v89 < *(void *)(a1 + 80));
    }
    if (a2) {
      v92 = @"supportedHighlightType";
    }
    else {
      v92 = @"supported_highlight_type";
    }
    [v4 setObject:v87 forKey:v92];

    unint64_t v11 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  v93 = [(id)a1 autocompleteOriginationInfo];
  v94 = v93;
  if (v93)
  {
    if (a2)
    {
      v95 = [v93 jsonRepresentation];
      v96 = @"autocompleteOriginationInfo";
    }
    else
    {
      v95 = [v93 dictionaryRepresentation];
      v96 = @"autocomplete_origination_info";
    }
    id v97 = v95;

    [v4 setObject:v97 forKey:v96];
  }

  int v98 = *(_DWORD *)(a1 + v11[1011]);
  if ((v98 & 0x20) != 0)
  {
    v99 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 242)];
    if (a2) {
      v100 = @"supportClientRankingCompositeFeatures";
    }
    else {
      v100 = @"support_client_ranking_composite_features";
    }
    [v4 setObject:v99 forKey:v100];

    int v98 = *(_DWORD *)(a1 + 252);
  }
  if ((v98 & 0x400) != 0)
  {
    v101 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 247)];
    if (a2) {
      v102 = @"supportStructuredRapAffordance";
    }
    else {
      v102 = @"support_structured_rap_affordance";
    }
    [v4 setObject:v101 forKey:v102];
  }
  v103 = *(void **)(a1 + 16);
  if (v103)
  {
    v104 = [v103 dictionaryRepresentation];
    v105 = v104;
    if (a2)
    {
      v106 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v104, "count"));
      v111[0] = MEMORY[0x1E4F143A8];
      v111[1] = 3221225472;
      v111[2] = __77__GEOPDAutocompleteParametersAllEntriesWithBrowse__dictionaryRepresentation___block_invoke;
      v111[3] = &unk_1E53D8860;
      id v107 = v106;
      id v112 = v107;
      [v105 enumerateKeysAndObjectsUsingBlock:v111];
      id v108 = v107;

      v105 = v108;
    }
    [v4 setObject:v105 forKey:@"Unknown Fields"];
  }
  id v109 = v4;

LABEL_167:

  return v109;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParametersAllEntriesWithBrowse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __77__GEOPDAutocompleteParametersAllEntriesWithBrowse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersAllEntriesWithBrowse *)-[GEOPDAutocompleteParametersAllEntriesWithBrowse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_340;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_340;
  }
  objc_super v7 = [v5 objectForKeyedSubscript:@"query"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [v6 setQuery:v8];
  }
  if (a3) {
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = @"viewportInfo";
  }
  else {
    $EAFDE4515419465CA71EC8A4C4CE129B v9 = @"viewport_info";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v11 = [GEOPDViewportInfo alloc];
    if (a3) {
      uint64_t v12 = [(GEOPDViewportInfo *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEOPDViewportInfo *)v11 initWithDictionary:v10];
    }
    unint64_t v13 = (void *)v12;
    [v6 setViewportInfo:v12];
  }
  if (a3) {
    unint64_t v14 = @"maxResults";
  }
  else {
    unint64_t v14 = @"max_results";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMaxResults:", objc_msgSend(v15, "intValue"));
  }

  if (a3) {
    unint64_t v16 = @"highlightDiff";
  }
  else {
    unint64_t v16 = @"highlight_diff";
  }
  unint64_t v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setHighlightDiff:", objc_msgSend(v17, "BOOLValue"));
  }

  if (a3) {
    v18 = @"categorySuggestionEntryMetadata";
  }
  else {
    v18 = @"category_suggestion_entry_metadata";
  }
  unint64_t v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v19 options:0];
    [v6 setCategorySuggestionEntryMetadata:v20];
  }
  if (a3) {
    v21 = @"categorySuggestionEntry";
  }
  else {
    v21 = @"category_suggestion_entry";
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEOPDAutocompleteEntry alloc];
    if (a3) {
      uint64_t v24 = [(GEOPDAutocompleteEntry *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEOPDAutocompleteEntry *)v23 initWithDictionary:v22];
    }
    v25 = (void *)v24;
    [v6 setCategorySuggestionEntry:v24];
  }
  if (a3) {
    v26 = @"interleaveCategorySuggestions";
  }
  else {
    v26 = @"interleave_category_suggestions";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setInterleaveCategorySuggestions:", objc_msgSend(v27, "BOOLValue"));
  }

  if (a3) {
    v28 = @"venueIdentifier";
  }
  else {
    v28 = @"venue_identifier";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOPDVenueIdentifier alloc];
    if (v30) {
      id v31 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v30, v29, a3);
    }
    else {
      id v31 = 0;
    }
    [v6 setVenueIdentifier:v31];
  }
  if (a3) {
    v32 = @"supportDirectionIntentSuggestions";
  }
  else {
    v32 = @"support_direction_intent_suggestions";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportDirectionIntentSuggestions:", objc_msgSend(v33, "BOOLValue"));
  }

  if (a3) {
    v34 = @"retainedSearch";
  }
  else {
    v34 = @"retained_search";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [GEOPDRetainedSearchMetadata alloc];
    if (v36) {
      v37 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v36, v35, a3);
    }
    else {
      v37 = 0;
    }
    [v6 setRetainedSearch:v37];
  }
  if (a3) {
    id v38 = @"supportUnresolvedDirectionIntent";
  }
  else {
    id v38 = @"support_unresolved_direction_intent";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportUnresolvedDirectionIntent:", objc_msgSend(v39, "BOOLValue"));
  }

  if (a3) {
    v40 = @"supportedListType";
  }
  else {
    v40 = @"supported_list_type";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  id v126 = v5;
  int v125 = a3;
  if (objc_opt_isKindOfClass())
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v121 = v41;
    id v42 = v41;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v143 objects:v151 count:16];
    if (!v43) {
      goto LABEL_89;
    }
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v144;
    while (1)
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v144 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v143 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v48 = v47;
          if ([v48 isEqualToString:@"UNKNOWN"])
          {
            uint64_t v49 = 0;
          }
          else if ([v48 isEqualToString:@"INTERLEAVED"])
          {
            uint64_t v49 = 1;
          }
          else if ([v48 isEqualToString:@"SECTION_ONLY_FOR_QUERY"])
          {
            uint64_t v49 = 2;
          }
          else
          {
            uint64_t v49 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v49 = [v47 intValue];
        }
        [v6 addSupportedListType:v49];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v143 objects:v151 count:16];
      if (!v44)
      {
LABEL_89:

        id v5 = v126;
        a3 = v125;
        v41 = v121;
        break;
      }
    }
  }

  if (a3) {
    v50 = @"querySuggestionEntry";
  }
  else {
    v50 = @"query_suggestion_entry";
  }
  id v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v52 = [GEOPDAutocompleteEntry alloc];
    if (a3) {
      uint64_t v53 = [(GEOPDAutocompleteEntry *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOPDAutocompleteEntry *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [v6 setQuerySuggestionEntry:v53];
  }
  if (a3) {
    v55 = @"supportClientRankingFeatureMetadata";
  }
  else {
    v55 = @"support_client_ranking_feature_metadata";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportClientRankingFeatureMetadata:", objc_msgSend(v56, "BOOLValue"));
  }

  if (a3) {
    unint64_t v57 = @"maxQueryBuilderSuggestions";
  }
  else {
    unint64_t v57 = @"max_query_builder_suggestions";
  }
  uint64_t v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMaxQueryBuilderSuggestions:", objc_msgSend(v58, "intValue"));
  }

  if (a3) {
    v59 = @"supportSectionHeader";
  }
  else {
    v59 = @"support_section_header";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportSectionHeader:", objc_msgSend(v60, "BOOLValue"));
  }

  if (a3) {
    v61 = @"supportedAutocompleteResultCellType";
  }
  else {
    v61 = @"supported_autocomplete_result_cell_type";
  }
  v62 = [v5 objectForKeyedSubscript:v61];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    v122 = v62;
    id v63 = v62;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v139 objects:v150 count:16];
    if (!v64) {
      goto LABEL_140;
    }
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v140;
    while (1)
    {
      for (uint64_t j = 0; j != v65; ++j)
      {
        if (*(void *)v140 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v139 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v69 = v68;
          if ([v69 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT"])
          {
            uint64_t v70 = 0;
          }
          else if ([v69 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY"])
          {
            uint64_t v70 = 1;
          }
          else if ([v69 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT"])
          {
            uint64_t v70 = 2;
          }
          else if ([v69 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE"])
          {
            uint64_t v70 = 3;
          }
          else if ([v69 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE"])
          {
            uint64_t v70 = 4;
          }
          else
          {
            uint64_t v70 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v70 = [v68 intValue];
        }
        [v6 addSupportedAutocompleteResultCellType:v70];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v139 objects:v150 count:16];
      if (!v65)
      {
LABEL_140:

        id v5 = v126;
        a3 = v125;
        v62 = v122;
        break;
      }
    }
  }

  if (a3) {
    v71 = @"supportRapAffordance";
  }
  else {
    v71 = @"support_rap_affordance";
  }
  v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportRapAffordance:", objc_msgSend(v72, "BOOLValue"));
  }

  if (a3) {
    v73 = @"knownRefinementType";
  }
  else {
    v73 = @"known_refinement_type";
  }
  v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v75 = v74;
    uint64_t v76 = [v75 countByEnumeratingWithState:&v135 objects:v149 count:16];
    if (!v76) {
      goto LABEL_177;
    }
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v136;
    while (1)
    {
      for (uint64_t k = 0; k != v77; ++k)
      {
        if (*(void *)v136 != v78) {
          objc_enumerationMutation(v75);
        }
        v80 = *(void **)(*((void *)&v135 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v81 = v80;
          if ([v81 isEqualToString:@"RESULT_REFINEMENT_TYPE_UNKNOWN"])
          {
            uint64_t v82 = 0;
          }
          else if ([v81 isEqualToString:@"RESULT_REFINEMENT_TYPE_TOGGLE"])
          {
            uint64_t v82 = 1;
          }
          else if ([v81 isEqualToString:@"RESULT_REFINEMENT_TYPE_RANGE"])
          {
            uint64_t v82 = 2;
          }
          else if ([v81 isEqualToString:@"RESULT_REFINEMENT_TYPE_MULTI_SELECT"])
          {
            uint64_t v82 = 3;
          }
          else if ([v81 isEqualToString:@"RESULT_REFINEMENT_TYPE_SORT"])
          {
            uint64_t v82 = 4;
          }
          else if ([v81 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME"])
          {
            uint64_t v82 = 5;
          }
          else if ([v81 isEqualToString:@"RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"])
          {
            uint64_t v82 = 6;
          }
          else
          {
            uint64_t v82 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v82 = [v80 intValue];
        }
        [v6 addKnownRefinementType:v82];
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v135 objects:v149 count:16];
      if (!v77)
      {
LABEL_177:

        id v5 = v126;
        a3 = v125;
        break;
      }
    }
  }

  if (a3) {
    v83 = @"placeSummaryRevision";
  }
  else {
    v83 = @"place_summary_revision";
  }
  v84 = [v5 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v85 = v84;
    if ([v85 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v86 = 0;
    }
    else if ([v85 isEqualToString:@"NAME"])
    {
      uint64_t v86 = 1;
    }
    else if ([v85 isEqualToString:@"CATEGORY"])
    {
      uint64_t v86 = 2;
    }
    else if ([v85 isEqualToString:@"DISTANCE"])
    {
      uint64_t v86 = 3;
    }
    else if ([v85 isEqualToString:@"PRICE"])
    {
      uint64_t v86 = 4;
    }
    else if ([v85 isEqualToString:@"HOURS"])
    {
      uint64_t v86 = 5;
    }
    else if ([v85 isEqualToString:@"ADDRESS"])
    {
      uint64_t v86 = 6;
    }
    else if ([v85 isEqualToString:@"RATINGS"])
    {
      uint64_t v86 = 7;
    }
    else if ([v85 isEqualToString:@"TRANSIT_SHIELDS"])
    {
      uint64_t v86 = 8;
    }
    else if ([v85 isEqualToString:@"USER_GENERATED_GUIDES"])
    {
      uint64_t v86 = 9;
    }
    else if ([v85 isEqualToString:@"CURATED_GUIDES"])
    {
      uint64_t v86 = 10;
    }
    else if ([v85 isEqualToString:@"EV_CHARGERS_NUMBER"])
    {
      uint64_t v86 = 11;
    }
    else
    {
      if ([v85 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
      {
        uint64_t v86 = 12;
      }
      else if ([v85 isEqualToString:@"STRING"])
      {
        uint64_t v86 = 13;
      }
      else if ([v85 isEqualToString:@"SERVER_OVERRIDE"])
      {
        uint64_t v86 = 14;
      }
      else if ([v85 isEqualToString:@"CONTAINMENT"])
      {
        uint64_t v86 = 15;
      }
      else if ([v85 isEqualToString:@"RECENT"])
      {
        uint64_t v86 = 16;
      }
      else if ([v85 isEqualToString:@"HIGHLIGHT_MAIN"])
      {
        uint64_t v86 = 17;
      }
      else if ([v85 isEqualToString:@"HIGHLIGHT_EXTRA"])
      {
        uint64_t v86 = 18;
      }
      else if ([v85 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
      {
        uint64_t v86 = 19;
      }
      else if ([v85 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
      {
        uint64_t v86 = 20;
      }
      else if ([v85 isEqualToString:@"PUBLISHER_DESCRIPTION"])
      {
        uint64_t v86 = 21;
      }
      else if ([v85 isEqualToString:@"SECONDARY_NAME"])
      {
        uint64_t v86 = 22;
      }
      else if ([v85 isEqualToString:@"FACTOID"])
      {
        uint64_t v86 = 23;
      }
      else if ([v85 isEqualToString:@"ARP_RATINGS"])
      {
        uint64_t v86 = 24;
      }
      else if ([v85 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
      {
        uint64_t v86 = 25;
      }
      else if ([v85 isEqualToString:@"DETOUR_TIME"])
      {
        uint64_t v86 = 26;
      }
      else if ([v85 isEqualToString:@"HIKING_DIFFICULTY"])
      {
        uint64_t v86 = 27;
      }
      else if ([v85 isEqualToString:@"HIKING_TRAIL_LENGTH"])
      {
        uint64_t v86 = 28;
      }
      else if ([v85 isEqualToString:@"PHOTO_CAROUSEL"])
      {
        uint64_t v86 = 29;
      }
      else if ([v85 isEqualToString:@"IN_USER_LIBRARY"])
      {
        uint64_t v86 = 30;
      }
      else if ([v85 isEqualToString:@"USER_NOTE"])
      {
        uint64_t v86 = 31;
      }
      else if ([v85 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
      {
        uint64_t v86 = 32;
      }
      else if ([v85 isEqualToString:@"HIKE_ROUTE_TYPE"])
      {
        uint64_t v86 = 33;
      }
      else if ([v85 isEqualToString:@"HIKE_ROUTE_DURATION"])
      {
        uint64_t v86 = 34;
      }
      else if ([v85 isEqualToString:@"HIKE_ROUTE_LENGTH"])
      {
        uint64_t v86 = 35;
      }
      else
      {
        uint64_t v86 = 0;
      }
      id v5 = v126;
      a3 = v125;
    }

    goto LABEL_261;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v86 = [v84 intValue];
LABEL_261:
    [v6 setPlaceSummaryRevision:v86];
  }

  if (a3) {
    v87 = @"supportedPlaceSummaryFormatType";
  }
  else {
    v87 = @"supported_place_summary_format_type";
  }
  v88 = [v5 objectForKeyedSubscript:v87];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v123 = v88;
    id v89 = v88;
    uint64_t v90 = [v89 countByEnumeratingWithState:&v131 objects:v148 count:16];
    if (!v90) {
      goto LABEL_289;
    }
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v132;
    while (1)
    {
      for (uint64_t m = 0; m != v91; ++m)
      {
        if (*(void *)v132 != v92) {
          objc_enumerationMutation(v89);
        }
        v94 = *(void **)(*((void *)&v131 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v95 = v94;
          if ([v95 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN"])
          {
            uint64_t v96 = 0;
          }
          else if ([v95 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_BOLD"])
          {
            uint64_t v96 = 1;
          }
          else if ([v95 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_ITALICS"])
          {
            uint64_t v96 = 2;
          }
          else if ([v95 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH"])
          {
            uint64_t v96 = 3;
          }
          else if ([v95 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"])
          {
            uint64_t v96 = 4;
          }
          else
          {
            uint64_t v96 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v96 = [v94 intValue];
        }
        [v6 addSupportedPlaceSummaryFormatType:v96];
      }
      uint64_t v91 = [v89 countByEnumeratingWithState:&v131 objects:v148 count:16];
      if (!v91)
      {
LABEL_289:

        id v5 = v126;
        a3 = v125;
        v88 = v123;
        break;
      }
    }
  }

  if (a3) {
    id v97 = @"evChargingParameters";
  }
  else {
    id v97 = @"ev_charging_parameters";
  }
  int v98 = [v5 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v99 = [GEOPDSSearchEvChargingParameters alloc];
    if (v99) {
      v100 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v99, v98, a3);
    }
    else {
      v100 = 0;
    }
    [v6 setEvChargingParameters:v100];
  }
  if (a3) {
    v101 = @"supportedHighlightType";
  }
  else {
    v101 = @"supported_highlight_type";
  }
  v102 = [v5 objectForKeyedSubscript:v101];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v124 = v102;
    id v103 = v102;
    uint64_t v104 = [v103 countByEnumeratingWithState:&v127 objects:v147 count:16];
    if (!v104) {
      goto LABEL_320;
    }
    uint64_t v105 = v104;
    uint64_t v106 = *(void *)v128;
    while (1)
    {
      for (uint64_t n = 0; n != v105; ++n)
      {
        if (*(void *)v128 != v106) {
          objc_enumerationMutation(v103);
        }
        id v108 = *(void **)(*((void *)&v127 + 1) + 8 * n);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v109 = v108;
          if ([v109 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_BOLD_HIGHLIGHT"])
          {
            uint64_t v110 = 0;
          }
          else if ([v109 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY"])
          {
            uint64_t v110 = 1;
          }
          else if ([v109 isEqualToString:@"AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY_INVERSE"])
          {
            uint64_t v110 = 2;
          }
          else
          {
            uint64_t v110 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v110 = [v108 intValue];
        }
        [v6 addSupportedHighlightType:v110];
      }
      uint64_t v105 = [v103 countByEnumeratingWithState:&v127 objects:v147 count:16];
      if (!v105)
      {
LABEL_320:

        id v5 = v126;
        a3 = v125;
        v102 = v124;
        break;
      }
    }
  }

  if (a3) {
    v111 = @"autocompleteOriginationInfo";
  }
  else {
    v111 = @"autocomplete_origination_info";
  }
  id v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v113 = [GEOPDAutocompleteOriginationInfo alloc];
    if (a3) {
      uint64_t v114 = [(GEOPDAutocompleteOriginationInfo *)v113 initWithJSON:v112];
    }
    else {
      uint64_t v114 = [(GEOPDAutocompleteOriginationInfo *)v113 initWithDictionary:v112];
    }
    v115 = (void *)v114;
    [v6 setAutocompleteOriginationInfo:v114];
  }
  if (a3) {
    v116 = @"supportClientRankingCompositeFeatures";
  }
  else {
    v116 = @"support_client_ranking_composite_features";
  }
  v117 = [v5 objectForKeyedSubscript:v116];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportClientRankingCompositeFeatures:", objc_msgSend(v117, "BOOLValue"));
  }

  if (a3) {
    v118 = @"supportStructuredRapAffordance";
  }
  else {
    v118 = @"support_structured_rap_affordance";
  }
  v119 = [v5 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSupportStructuredRapAffordance:", objc_msgSend(v119, "BOOLValue"));
  }

  a1 = v6;
LABEL_340:

  return a1;
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersAllEntriesWithBrowse *)-[GEOPDAutocompleteParametersAllEntriesWithBrowse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1115;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1116;
    }
    GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAutocompleteParametersAllEntriesWithBrowseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersAllEntriesWithBrowseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersAllEntriesWithBrowseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteParametersAllEntriesWithBrowseIsDirty((uint64_t)self) & 1) == 0)
  {
    unint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v16 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
    goto LABEL_63;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self readAll:0];
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  id v5 = v16;
  if (self->_viewportInfo)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v16;
    $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
  if (self->_categorySuggestionEntryMetadata)
  {
    PBDataWriterWriteDataField();
    id v5 = v16;
  }
  if (self->_categorySuggestionEntry)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
  if (self->_venueIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
  if (self->_retainedSearch)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
  if (self->_supportedListTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v16;
      ++v7;
    }
    while (v7 < self->_supportedListTypes.count);
  }
  if (self->_querySuggestionEntry)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v8 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_60:
    PBDataWriterWriteInt32Field();
    id v5 = v16;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  PBDataWriterWriteBOOLField();
  id v5 = v16;
  $EAFDE4515419465CA71EC8A4C4CE129B v8 = self->_flags;
  if (*(unsigned char *)&v8) {
    goto LABEL_60;
  }
LABEL_32:
  if ((*(_WORD *)&v8 & 0x200) != 0)
  {
LABEL_33:
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
LABEL_34:
  if (self->_supportedAutocompleteResultCellTypes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v16;
      ++v9;
    }
    while (v9 < self->_supportedAutocompleteResultCellTypes.count);
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
  if (self->_knownRefinementTypes.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v16;
      ++v10;
    }
    while (v10 < self->_knownRefinementTypes.count);
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v16;
  }
  if (self->_supportedPlaceSummaryFormatTypes.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v16;
      ++v11;
    }
    while (v11 < self->_supportedPlaceSummaryFormatTypes.count);
  }
  if (self->_evChargingParameters)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  if (self->_supportedHighlightTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v16;
      ++v12;
    }
    while (v12 < self->_supportedHighlightTypes.count);
  }
  if (self->_autocompleteOriginationInfo)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v16;
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
    $EAFDE4515419465CA71EC8A4C4CE129B v13 = self->_flags;
  }
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v5 = v16;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_63:
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readAutocompleteOriginationInfo]((uint64_t)self);
  if ([(GEOPDAutocompleteOriginationInfo *)self->_autocompleteOriginationInfo hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntry]((uint64_t)self);
  if ([(GEOPDAutocompleteEntry *)self->_categorySuggestionEntry hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuerySuggestionEntry]((uint64_t)self);
  if ([(GEOPDAutocompleteEntry *)self->_querySuggestionEntry hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return [(GEOPDViewportInfo *)viewportInfo hasGreenTeaWithValue:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteParametersAllEntriesWithBrowseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v9;

  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v11;

  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_maxResults;
    *(_DWORD *)(v5 + 252) |= 2u;
    $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 240) = self->_highlightDiff;
    *(_DWORD *)(v5 + 252) |= 8u;
  }
  uint64_t v14 = [(NSData *)self->_categorySuggestionEntryMetadata copyWithZone:a3];
  v15 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v14;

  id v16 = [(GEOPDAutocompleteEntry *)self->_categorySuggestionEntry copyWithZone:a3];
  unint64_t v17 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v16;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 241) = self->_interleaveCategorySuggestions;
    *(_DWORD *)(v5 + 252) |= 0x10u;
  }
  id v18 = [(GEOPDVenueIdentifier *)self->_venueIdentifier copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v18;

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 244) = self->_supportDirectionIntentSuggestions;
    *(_DWORD *)(v5 + 252) |= 0x80u;
  }
  id v20 = [(GEOPDRetainedSearchMetadata *)self->_retainedSearch copyWithZone:a3];
  v21 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v20;

  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *(unsigned char *)(v5 + 248) = self->_supportUnresolvedDirectionIntent;
    *(_DWORD *)(v5 + 252) |= 0x800u;
  }
  PBRepeatedInt32Copy();
  id v22 = [(GEOPDAutocompleteEntry *)self->_querySuggestionEntry copyWithZone:a3];
  v23 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v22;

  $EAFDE4515419465CA71EC8A4C4CE129B v24 = self->_flags;
  if ((*(unsigned char *)&v24 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v24 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_30:
    *(_DWORD *)(v5 + 228) = self->_maxQueryBuilderSuggestions;
    *(_DWORD *)(v5 + 252) |= 1u;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  *(unsigned char *)(v5 + 243) = self->_supportClientRankingFeatureMetadata;
  *(_DWORD *)(v5 + 252) |= 0x40u;
  $EAFDE4515419465CA71EC8A4C4CE129B v24 = self->_flags;
  if (*(unsigned char *)&v24) {
    goto LABEL_30;
  }
LABEL_17:
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
LABEL_18:
    *(unsigned char *)(v5 + 246) = self->_supportSectionHeader;
    *(_DWORD *)(v5 + 252) |= 0x200u;
  }
LABEL_19:
  PBRepeatedInt32Copy();
  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 245) = self->_supportRapAffordance;
    *(_DWORD *)(v5 + 252) |= 0x100u;
  }
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 236) = self->_placeSummaryRevision;
    *(_DWORD *)(v5 + 252) |= 4u;
  }
  PBRepeatedInt32Copy();
  id v25 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters copyWithZone:a3];
  v26 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v25;

  PBRepeatedInt32Copy();
  id v27 = [(GEOPDAutocompleteOriginationInfo *)self->_autocompleteOriginationInfo copyWithZone:a3];
  v28 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v27;

  $EAFDE4515419465CA71EC8A4C4CE129B v29 = self->_flags;
  if ((*(unsigned char *)&v29 & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 242) = self->_supportClientRankingCompositeFeatures;
    *(_DWORD *)(v5 + 252) |= 0x20u;
    $EAFDE4515419465CA71EC8A4C4CE129B v29 = self->_flags;
  }
  if ((*(_WORD *)&v29 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 247) = self->_supportStructuredRapAffordance;
    *(_DWORD *)(v5 + 252) |= 0x400u;
  }
  v30 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v30;
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_109;
  }
  [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self readAll:1];
  [v4 readAll:1];
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_109;
    }
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 26))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_109;
    }
  }
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 63);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_maxResults != *((_DWORD *)v4 + 58)) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0) {
      goto LABEL_109;
    }
    if (self->_highlightDiff)
    {
      if (!*((unsigned char *)v4 + 240)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 240))
    {
      goto LABEL_109;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_109;
  }
  categorySuggestionEntryMetadata = self->_categorySuggestionEntryMetadata;
  if ((unint64_t)categorySuggestionEntryMetadata | *((void *)v4 + 19)
    && !-[NSData isEqual:](categorySuggestionEntryMetadata, "isEqual:"))
  {
    goto LABEL_109;
  }
  categorySuggestionEntry = self->_categorySuggestionEntry;
  if ((unint64_t)categorySuggestionEntry | *((void *)v4 + 20))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](categorySuggestionEntry, "isEqual:")) {
      goto LABEL_109;
    }
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v11 = self->_flags;
  int v12 = *((_DWORD *)v4 + 63);
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0) {
      goto LABEL_109;
    }
    if (self->_interleaveCategorySuggestions)
    {
      if (!*((unsigned char *)v4 + 241)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 241))
    {
      goto LABEL_109;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_109;
  }
  venueIdentifier = self->_venueIdentifier;
  if ((unint64_t)venueIdentifier | *((void *)v4 + 25))
  {
    if (!-[GEOPDVenueIdentifier isEqual:](venueIdentifier, "isEqual:")) {
      goto LABEL_109;
    }
    $EAFDE4515419465CA71EC8A4C4CE129B v11 = self->_flags;
    int v12 = *((_DWORD *)v4 + 63);
  }
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_109;
    }
    if (self->_supportDirectionIntentSuggestions)
    {
      if (!*((unsigned char *)v4 + 244)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 244))
    {
      goto LABEL_109;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_109;
  }
  retainedSearch = self->_retainedSearch;
  if ((unint64_t)retainedSearch | *((void *)v4 + 24))
  {
    if (!-[GEOPDRetainedSearchMetadata isEqual:](retainedSearch, "isEqual:")) {
      goto LABEL_109;
    }
    $EAFDE4515419465CA71EC8A4C4CE129B v11 = self->_flags;
    int v12 = *((_DWORD *)v4 + 63);
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0) {
      goto LABEL_109;
    }
    if (self->_supportUnresolvedDirectionIntent)
    {
      if (!*((unsigned char *)v4 + 248)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 248))
    {
      goto LABEL_109;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_109;
  }
  querySuggestionEntry = self->_querySuggestionEntry;
  if ((unint64_t)querySuggestionEntry | *((void *)v4 + 22))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](querySuggestionEntry, "isEqual:")) {
      goto LABEL_109;
    }
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v16 = self->_flags;
  int v17 = *((_DWORD *)v4 + 63);
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0) {
      goto LABEL_109;
    }
    if (self->_supportClientRankingFeatureMetadata)
    {
      if (!*((unsigned char *)v4 + 243)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 243))
    {
      goto LABEL_109;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_109;
  }
  if (*(unsigned char *)&v16)
  {
    if ((v17 & 1) == 0 || self->_maxQueryBuilderSuggestions != *((_DWORD *)v4 + 57)) {
      goto LABEL_109;
    }
  }
  else if (v17)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0) {
      goto LABEL_109;
    }
    if (self->_supportSectionHeader)
    {
      if (!*((unsigned char *)v4 + 246)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 246))
    {
      goto LABEL_109;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_109;
  }
  int v18 = *((_DWORD *)v4 + 63);
  if (*((unsigned char *)&self->_flags + 1))
  {
    if ((v18 & 0x100) == 0) {
      goto LABEL_109;
    }
    if (self->_supportRapAffordance)
    {
      if (!*((unsigned char *)v4 + 245)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 245))
    {
      goto LABEL_109;
    }
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_109;
  }
  int v19 = *((_DWORD *)v4 + 63);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 59)) {
      goto LABEL_109;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_109;
  }
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((void *)v4 + 21))
  {
    if (!-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:")) {
      goto LABEL_109;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_109;
  }
  autocompleteOriginationInfo = self->_autocompleteOriginationInfo;
  if ((unint64_t)autocompleteOriginationInfo | *((void *)v4 + 18))
  {
    if (!-[GEOPDAutocompleteOriginationInfo isEqual:](autocompleteOriginationInfo, "isEqual:")) {
      goto LABEL_109;
    }
  }
  $EAFDE4515419465CA71EC8A4C4CE129B v22 = self->_flags;
  int v23 = *((_DWORD *)v4 + 63);
  if ((*(unsigned char *)&v22 & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0) {
      goto LABEL_109;
    }
    if (self->_supportClientRankingCompositeFeatures)
    {
      if (!*((unsigned char *)v4 + 242)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 242))
    {
      goto LABEL_109;
    }
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    if ((v23 & 0x400) != 0)
    {
      if (self->_supportStructuredRapAffordance)
      {
        if (!*((unsigned char *)v4 + 247)) {
          goto LABEL_109;
        }
      }
      else if (*((unsigned char *)v4 + 247))
      {
        goto LABEL_109;
      }
      BOOL v24 = 1;
      goto LABEL_110;
    }
LABEL_109:
    BOOL v24 = 0;
    goto LABEL_110;
  }
  BOOL v24 = (*((_DWORD *)v4 + 63) & 0x400) == 0;
LABEL_110:

  return v24;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self readAll:1];
  NSUInteger v32 = [(NSString *)self->_query hash];
  unint64_t v31 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  $EAFDE4515419465CA71EC8A4C4CE129B flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    uint64_t v30 = 2654435761 * self->_maxResults;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
LABEL_3:
      uint64_t v29 = 2654435761 * self->_highlightDiff;
      goto LABEL_6;
    }
  }
  uint64_t v29 = 0;
LABEL_6:
  uint64_t v28 = [(NSData *)self->_categorySuggestionEntryMetadata hash];
  unint64_t v27 = [(GEOPDAutocompleteEntry *)self->_categorySuggestionEntry hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v26 = 2654435761 * self->_interleaveCategorySuggestions;
  }
  else {
    uint64_t v26 = 0;
  }
  unint64_t v25 = [(GEOPDVenueIdentifier *)self->_venueIdentifier hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v24 = 2654435761 * self->_supportDirectionIntentSuggestions;
  }
  else {
    uint64_t v24 = 0;
  }
  unint64_t v23 = [(GEOPDRetainedSearchMetadata *)self->_retainedSearch hash];
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    uint64_t v22 = 2654435761 * self->_supportUnresolvedDirectionIntent;
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v21 = PBRepeatedInt32Hash();
  unint64_t v20 = [(GEOPDAutocompleteEntry *)self->_querySuggestionEntry hash];
  $EAFDE4515419465CA71EC8A4C4CE129B v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x40) == 0)
  {
    uint64_t v19 = 0;
    if (*(unsigned char *)&v4) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v18 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  uint64_t v19 = 2654435761 * self->_supportClientRankingFeatureMetadata;
  if ((*(unsigned char *)&v4 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_maxQueryBuilderSuggestions;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_18:
    uint64_t v17 = 2654435761 * self->_supportSectionHeader;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v17 = 0;
LABEL_22:
  uint64_t v5 = PBRepeatedInt32Hash();
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v6 = 2654435761 * self->_supportRapAffordance;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_placeSummaryRevision;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = PBRepeatedInt32Hash();
  unint64_t v10 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters hash];
  uint64_t v11 = PBRepeatedInt32Hash();
  unint64_t v12 = [(GEOPDAutocompleteOriginationInfo *)self->_autocompleteOriginationInfo hash];
  $EAFDE4515419465CA71EC8A4C4CE129B v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
    uint64_t v14 = 2654435761 * self->_supportClientRankingCompositeFeatures;
    if ((*(_WORD *)&v13 & 0x400) != 0) {
      goto LABEL_30;
    }
LABEL_32:
    uint64_t v15 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&v13 & 0x400) == 0) {
    goto LABEL_32;
  }
LABEL_30:
  uint64_t v15 = 2654435761 * self->_supportStructuredRapAffordance;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v40 = a3;
  [v40 readAll:0];
  id v4 = v40;
  if (*((void *)v40 + 23))
  {
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setQuery:](self, "setQuery:");
    id v4 = v40;
  }
  viewportInfo = self->_viewportInfo;
  uint64_t v6 = *((void *)v4 + 26);
  if (viewportInfo)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setViewportInfo:](self, "setViewportInfo:");
  }
  id v4 = v40;
LABEL_9:
  int v7 = *((_DWORD *)v4 + 63);
  if ((v7 & 2) != 0)
  {
    self->_maxResults = *((_DWORD *)v4 + 58);
    *(_DWORD *)&self->_flags |= 2u;
    int v7 = *((_DWORD *)v4 + 63);
  }
  if ((v7 & 8) != 0)
  {
    self->_highlightDiff = *((unsigned char *)v4 + 240);
    *(_DWORD *)&self->_flags |= 8u;
  }
  if (*((void *)v4 + 19))
  {
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setCategorySuggestionEntryMetadata:](self, "setCategorySuggestionEntryMetadata:");
    id v4 = v40;
  }
  categorySuggestionEntry = self->_categorySuggestionEntry;
  uint64_t v9 = *((void *)v4 + 20);
  if (categorySuggestionEntry)
  {
    if (!v9) {
      goto LABEL_21;
    }
    -[GEOPDAutocompleteEntry mergeFrom:](categorySuggestionEntry, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_21;
    }
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setCategorySuggestionEntry:](self, "setCategorySuggestionEntry:");
  }
  id v4 = v40;
LABEL_21:
  if ((*((unsigned char *)v4 + 252) & 0x10) != 0)
  {
    self->_interleaveCategorySuggestions = *((unsigned char *)v4 + 241);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  venueIdentifier = self->_venueIdentifier;
  uint64_t v11 = (void *)*((void *)v4 + 25);
  if (venueIdentifier)
  {
    if (!v11) {
      goto LABEL_29;
    }
    -[GEOPDVenueIdentifier mergeFrom:]((uint64_t)venueIdentifier, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_29;
    }
    [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self setVenueIdentifier:*((void *)v4 + 25)];
  }
  id v4 = v40;
LABEL_29:
  if ((*((unsigned char *)v4 + 252) & 0x80) != 0)
  {
    self->_supportDirectionIntentSuggestions = *((unsigned char *)v4 + 244);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
  retainedSearch = self->_retainedSearch;
  $EAFDE4515419465CA71EC8A4C4CE129B v13 = (void *)*((void *)v4 + 24);
  if (retainedSearch)
  {
    if (!v13) {
      goto LABEL_37;
    }
    -[GEOPDRetainedSearchMetadata mergeFrom:]((uint64_t)retainedSearch, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_37;
    }
    [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self setRetainedSearch:*((void *)v4 + 24)];
  }
  id v4 = v40;
LABEL_37:
  if ((*((unsigned char *)v4 + 253) & 8) != 0)
  {
    self->_supportUnresolvedDirectionIntent = *((unsigned char *)v4 + 248);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  uint64_t v14 = [v4 supportedListTypesCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t i = 0; i != v15; ++i)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedListType:](self, "addSupportedListType:", [v40 supportedListTypeAtIndex:i]);
  }
  querySuggestionEntry = self->_querySuggestionEntry;
  id v18 = v40;
  uint64_t v19 = *((void *)v40 + 22);
  if (querySuggestionEntry)
  {
    if (!v19) {
      goto LABEL_48;
    }
    -[GEOPDAutocompleteEntry mergeFrom:](querySuggestionEntry, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_48;
    }
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setQuerySuggestionEntry:](self, "setQuerySuggestionEntry:");
  }
  id v18 = v40;
LABEL_48:
  int v20 = *((_DWORD *)v18 + 63);
  if ((v20 & 0x40) != 0)
  {
    self->_supportClientRankingFeatureMetadata = *((unsigned char *)v18 + 243);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v20 = *((_DWORD *)v18 + 63);
    if ((v20 & 1) == 0)
    {
LABEL_50:
      if ((v20 & 0x200) == 0) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else if ((v20 & 1) == 0)
  {
    goto LABEL_50;
  }
  self->_maxQueryBuilderSuggestions = *((_DWORD *)v18 + 57);
  *(_DWORD *)&self->_flags |= 1u;
  if ((*((_DWORD *)v18 + 63) & 0x200) != 0)
  {
LABEL_51:
    self->_supportSectionHeader = *((unsigned char *)v18 + 246);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
LABEL_52:
  uint64_t v21 = [v18 supportedAutocompleteResultCellTypesCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (uint64_t j = 0; j != v22; ++j)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedAutocompleteResultCellType:](self, "addSupportedAutocompleteResultCellType:", [v40 supportedAutocompleteResultCellTypeAtIndex:j]);
  }
  if (*((unsigned char *)v40 + 253))
  {
    self->_supportRapAffordance = *((unsigned char *)v40 + 245);
    *(_DWORD *)&self->_flags |= 0x100u;
  }
  uint64_t v24 = [v40 knownRefinementTypesCount];
  if (v24)
  {
    uint64_t v25 = v24;
    for (uint64_t k = 0; k != v25; ++k)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addKnownRefinementType:](self, "addKnownRefinementType:", [v40 knownRefinementTypeAtIndex:k]);
  }
  if ((*((unsigned char *)v40 + 252) & 4) != 0)
  {
    self->_placeSummaryRevisiouint64_t n = *((_DWORD *)v40 + 59);
    *(_DWORD *)&self->_flags |= 4u;
  }
  uint64_t v27 = [v40 supportedPlaceSummaryFormatTypesCount];
  if (v27)
  {
    uint64_t v28 = v27;
    for (uint64_t m = 0; m != v28; ++m)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedPlaceSummaryFormatType:](self, "addSupportedPlaceSummaryFormatType:", [v40 supportedPlaceSummaryFormatTypeAtIndex:m]);
  }
  evChargingParameters = self->_evChargingParameters;
  unint64_t v31 = v40;
  NSUInteger v32 = (void *)*((void *)v40 + 21);
  if (evChargingParameters)
  {
    if (!v32) {
      goto LABEL_74;
    }
    -[GEOPDSSearchEvChargingParameters mergeFrom:]((uint64_t)evChargingParameters, v32);
  }
  else
  {
    if (!v32) {
      goto LABEL_74;
    }
    [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self setEvChargingParameters:*((void *)v40 + 21)];
  }
  unint64_t v31 = v40;
LABEL_74:
  uint64_t v33 = [v31 supportedHighlightTypesCount];
  if (v33)
  {
    uint64_t v34 = v33;
    for (uint64_t n = 0; n != v34; ++n)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedHighlightType:](self, "addSupportedHighlightType:", [v40 supportedHighlightTypeAtIndex:n]);
  }
  autocompleteOriginationInfo = self->_autocompleteOriginationInfo;
  id v37 = v40;
  uint64_t v38 = *((void *)v40 + 18);
  if (autocompleteOriginationInfo)
  {
    if (!v38) {
      goto LABEL_83;
    }
    -[GEOPDAutocompleteOriginationInfo mergeFrom:](autocompleteOriginationInfo, "mergeFrom:");
  }
  else
  {
    if (!v38) {
      goto LABEL_83;
    }
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setAutocompleteOriginationInfo:](self, "setAutocompleteOriginationInfo:");
  }
  id v37 = v40;
LABEL_83:
  int v39 = *((_DWORD *)v37 + 63);
  if ((v39 & 0x20) != 0)
  {
    self->_supportClientRankingCompositeFeatures = *((unsigned char *)v37 + 242);
    *(_DWORD *)&self->_flags |= 0x20u;
    int v39 = *((_DWORD *)v37 + 63);
  }
  if ((v39 & 0x400) != 0)
  {
    self->_supportStructuredRapAffordance = *((unsigned char *)v37 + 247);
    *(_DWORD *)&self->_flags |= 0x400u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1120);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8001000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self readAll:0];
    [(GEOPDViewportInfo *)self->_viewportInfo clearUnknownFields:1];
    [(GEOPDAutocompleteEntry *)self->_categorySuggestionEntry clearUnknownFields:1];
    -[GEOPDVenueIdentifier clearUnknownFields:]((uint64_t)self->_venueIdentifier, 1);
    -[GEOPDRetainedSearchMetadata clearUnknownFields:]((uint64_t)self->_retainedSearch, 1);
    [(GEOPDAutocompleteEntry *)self->_querySuggestionEntry clearUnknownFields:1];
    -[GEOPDSSearchEvChargingParameters clearUnknownFields:]((uint64_t)self->_evChargingParameters, 1);
    autocompleteOriginationInfo = self->_autocompleteOriginationInfo;
    [(GEOPDAutocompleteOriginationInfo *)autocompleteOriginationInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_retainedSearch, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_querySuggestionEntry, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_categorySuggestionEntry, 0);
  objc_storeStrong((id *)&self->_categorySuggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_autocompleteOriginationInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end