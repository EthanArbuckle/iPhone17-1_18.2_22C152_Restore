@interface MKTransitDeparturesDataProvider
- (BOOL)_hasConnectionsSection;
- (BOOL)_hasIncidentsSection;
- (BOOL)_hasPlaceCardMessageSection;
- (BOOL)_isSectionTypeEnabled:(int64_t)a3;
- (BOOL)_systemHasInactiveLines:(id)a3;
- (BOOL)allowsSystemSectionCollapsing;
- (BOOL)isActive;
- (BOOL)isHidingDeparturesForSystem:(id)a3;
- (BOOL)isLastSectionForSystem:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)isStuckWithExpiredInfo;
- (BOOL)supportsSystemSectionCollapsing;
- (GEOAttribution)transitPunchoutAttribution;
- (GEOMapItemTransitInfo)transitInfo;
- (GEOTransitAttribution)transitAttribution;
- (GEOTransitSystem)selectedSystem;
- (MKMapItem)mapItem;
- (MKTransitDeparturesDataProvider)initWithMapItem:(id)a3;
- (MKTransitDeparturesDataProviderDelegate)delegate;
- (NSArray)connections;
- (NSArray)incidents;
- (NSArray)sectionControllers;
- (NSArray)stationSystems;
- (NSDate)departureCutoffDate;
- (NSDate)lastCutoffDateWithValidSchedule;
- (NSSet)disabledSections;
- (NSString)lastInfoRefreshErrorDescription;
- (id)_controllerForSection:(int64_t)a3;
- (id)_departureCutoffDateForLine:(id)a3;
- (id)_departureCutoffDateForSequence:(id)a3;
- (id)_departureSequencesForSection:(int64_t)a3;
- (id)_directionsForSystem:(id)a3 hasSequencesWithNoDirection:(BOOL *)a4;
- (id)_identifierForSection:(int64_t)a3;
- (id)_identifierForSequence:(id)a3;
- (id)_identifierForSystem:(id)a3;
- (id)_inactiveLinesControllerForSection:(int64_t)a3;
- (id)_inactiveLinesForSystem:(id)a3;
- (id)_indexSetForHidingShowingSystem:(id)a3;
- (id)_systemForSection:(int64_t)a3 directionIndex:(int64_t *)a4;
- (id)departuresControllerForSection:(int64_t)a3;
- (id)departuresSectionControllersForSystem:(id)a3;
- (id)directionForSection:(int64_t)a3;
- (id)dominantIncidentForDepartureSequence:(id)a3;
- (id)inactiveLinesForSection:(int64_t)a3;
- (id)inactiveLinesSectionControllersForSystem:(id)a3;
- (id)incidentsForIncidentsSection;
- (id)incidentsForSystemIncidentsSection:(id)a3;
- (id)possibleActions;
- (id)systemForSection:(int64_t)a3;
- (id)ticketForTransitMapItemUpdater:(id)a3;
- (int64_t)_numberOfDeparturesSectionsForSystem:(id)a3;
- (int64_t)_sectionForIdentifier:(id)a3;
- (int64_t)departureSequenceFrequencyTypeForSection:(int64_t)a3;
- (int64_t)indexOfFirstSectionWithType:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionTypeAtIndex:(int64_t)a3;
- (void)_updateRefreshFailureErrorDescription;
- (void)hideDeparturesForSystem:(id)a3 removedIndices:(id *)a4;
- (void)refreshSections;
- (void)refreshStationSystems;
- (void)reloadData;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDepartureCutoffDate:(id)a3;
- (void)setDisabledSections:(id)a3;
- (void)setLastCutoffDateWithValidSchedule:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setSelectedSystem:(id)a3;
- (void)setSupportSystemSectionCollapsing:(BOOL)a3;
- (void)showDeparturesForSystem:(id)a3 insertedIndices:(id *)a4;
- (void)showNextPageInSection:(int64_t)a3;
- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4;
- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5;
@end

@implementation MKTransitDeparturesDataProvider

- (MKTransitDeparturesDataProvider)initWithMapItem:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MKTransitDeparturesDataProvider;
  v6 = [(MKTransitDeparturesDataProvider *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v7->_supportSystemSectionCollapsing = 1;
    v8 = [(MKTransitDeparturesDataProvider *)v7 mapItem];
    v9 = [v8 _transitInfo];
    v7->_wantsSystemSectionCollapsing = (unint64_t)[v9 systemsCount] > 1;

    v10 = [[MKTransitItemIncidentsController alloc] initWithMapItem:v5];
    incidentsController = v7->_incidentsController;
    v7->_incidentsController = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionControllers = v7->_sectionControllers;
    v7->_sectionControllers = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pagedSectionIdentifiers = v7->_pagedSectionIdentifiers;
    v7->_pagedSectionIdentifiers = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedSequencesForSection = v7->_cachedSequencesForSection;
    v7->_cachedSequencesForSection = v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    cachedDirectionsForSystem = v7->_cachedDirectionsForSystem;
    v7->_cachedDirectionsForSystem = (NSMapTable *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    cachedSystemHasInactiveLines = v7->_cachedSystemHasInactiveLines;
    v7->_cachedSystemHasInactiveLines = (NSMapTable *)v20;

    v22 = [[MKTransitMapItemUpdater alloc] initWithMapItem:v7->_mapItem delegate:v7];
    mapItemUpdater = v7->_mapItemUpdater;
    v7->_mapItemUpdater = v22;

    v7->_lastFailureDiagnosis = 0;
    [(MKTransitDeparturesDataProvider *)v7 refreshStationSystems];
    if ([(NSArray *)v7->_stationSystems count])
    {
      uint64_t v24 = [(NSArray *)v7->_stationSystems firstObject];
      selectedSystem = v7->_selectedSystem;
      v7->_selectedSystem = (GEOTransitSystem *)v24;
    }
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v7 selector:sel_reloadData name:*MEMORY[0x1E4F1C370] object:0];

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v7 selector:sel_reloadData name:*MEMORY[0x1E4F1C4F8] object:0];
  }
  return v7;
}

- (GEOMapItemTransitInfo)transitInfo
{
  v2 = [(MKTransitDeparturesDataProvider *)self mapItem];
  v3 = [v2 _transitInfo];

  return (GEOMapItemTransitInfo *)v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    if (a3)
    {
      id v5 = +[MKTransitItemReferenceDateUpdater referenceDate];
      [(MKTransitDeparturesDataProvider *)self setDepartureCutoffDate:v5];
    }
    mapItemUpdater = self->_mapItemUpdater;
    [(MKTransitMapItemUpdater *)mapItemUpdater setActive:v3];
  }
}

- (void)setSupportSystemSectionCollapsing:(BOOL)a3
{
  self->_supportSystemSectionCollapsing = a3;
  v4 = [(MKTransitDeparturesDataProvider *)self mapItem];
  id v5 = [v4 _transitInfo];
  self->_wantsSystemSectionCollapsing = (unint64_t)[v5 systemsCount] > 1;

  [(MKTransitDeparturesDataProvider *)self refreshSections];
}

- (BOOL)allowsSystemSectionCollapsing
{
  return 0;
}

- (NSSet)disabledSections
{
  disabledSections = self->_disabledSections;
  if (!disabledSections)
  {
    v4 = [MEMORY[0x1E4F1CAD0] set];
    id v5 = self->_disabledSections;
    self->_disabledSections = v4;

    disabledSections = self->_disabledSections;
  }

  return disabledSections;
}

- (void)refreshStationSystems
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MKTransitDeparturesDataProvider *)self mapItem];
  id v5 = [v4 _transitInfo];
  v6 = [v5 systems];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 6, (void)v21))
        {
          v13 = [(MKTransitDeparturesDataProvider *)self incidentsForSystemIncidentsSection:v12];
          BOOL v14 = [v13 count] != 0;
        }
        else
        {
          BOOL v14 = 0;
        }
        if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:4]) {
          int64_t v15 = [(MKTransitDeparturesDataProvider *)self _numberOfDeparturesSectionsForSystem:v12];
        }
        else {
          int64_t v15 = 0;
        }
        if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:7])
        {
          v16 = [(MKTransitDeparturesDataProvider *)self _inactiveLinesForSystem:v12];
        }
        else
        {
          v16 = 0;
        }
        if ([v16 count]) {
          BOOL v17 = 0;
        }
        else {
          BOOL v17 = v15 <= 0;
        }
        int v18 = !v17 || v14;
        if (v18 == 1) {
          [v3 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v19 = (NSArray *)[v3 copy];
  stationSystems = self->_stationSystems;
  self->_stationSystems = v19;
}

- (void)refreshSections
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MKTransitDeparturesDataProvider *)self mapItem];
  id v5 = [v4 _transitInfo];

  if (v5)
  {
    if ([(MKTransitDeparturesDataProvider *)self _hasIncidentsSection]) {
      [v3 addObject:&unk_1ED97EA18];
    }
    if ([(MKTransitDeparturesDataProvider *)self _hasPlaceCardMessageSection]) {
      [v3 addObject:&unk_1ED97EA00];
    }
    v37 = v3;
    if (self->_hiddenSections)
    {
      BOOL v39 = 0;
    }
    else
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      hiddenSections = self->_hiddenSections;
      self->_hiddenSections = v6;

      BOOL v39 = [(MKTransitDeparturesDataProvider *)self allowsSystemSectionCollapsing];
    }
    [(MKTransitDeparturesDataProvider *)self refreshStationSystems];
    uint64_t v8 = self->_stationSystems;
    uint64_t v9 = v8;
    selectedSystem = self->_selectedSystem;
    if (selectedSystem
      || ([(NSArray *)v8 firstObject],
          v11 = (GEOTransitSystem *)objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = self->_selectedSystem,
          self->_selectedSystem = v11,
          v12,
          (selectedSystem = self->_selectedSystem) != 0))
    {
      v58[0] = selectedSystem;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];

      uint64_t v9 = (void *)v13;
    }
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v9;
    uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v43)
    {
      unint64_t v44 = 0;
      uint64_t v41 = *(void *)v53;
      v42 = self;
      do
      {
        for (uint64_t i = 0; i != v43; uint64_t i = v29 + 1)
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:6])
          {
            int v18 = [(MKTransitDeparturesDataProvider *)self incidentsForSystemIncidentsSection:v16];
            uint64_t v19 = [v18 count];

            if (v19) {
              [v17 addObject:&unk_1ED97EA30];
            }
          }
          if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:4])
          {
            uint64_t v20 = [(MKTransitDeparturesDataProvider *)self _numberOfDeparturesSectionsForSystem:v16];
            if (v20 >= 1)
            {
              do
              {
                [v17 addObject:&unk_1ED97EA48];
                --v20;
              }
              while (v20);
            }
          }
          uint64_t v45 = v16;
          uint64_t v46 = i;
          if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:7])
          {
            long long v21 = [(MKTransitDeparturesDataProvider *)self _inactiveLinesForSystem:v16];
          }
          else
          {
            long long v21 = 0;
          }
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v22 = v21;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v49 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v48 + 1) + 8 * j);
                [v17 addObject:&unk_1ED97EA60];
                v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
                [v14 setObject:v27 forKeyedSubscript:v28];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v24);
          }

          if ([v17 count])
          {
            [v17 insertObject:&unk_1ED97EA78 atIndex:0];
            [v40 addObjectsFromArray:v17];
            self = v42;
            uint64_t v29 = v46;
            if (v39)
            {
              v30 = v42->_hiddenSections;
              v31 = [(MKTransitDeparturesDataProvider *)v42 _identifierForSystem:v45];
              [(NSMutableSet *)v30 addObject:v31];
            }
            ++v44;
          }
          else
          {
            self = v42;
            uint64_t v29 = v46;
          }
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v43);
    }
    else
    {
      unint64_t v44 = 0;
    }

    v32 = (NSDictionary *)[v14 copy];
    lineLookupBySection = self->_lineLookupBySection;
    self->_lineLookupBySection = v32;

    id v3 = v37;
    if (v44 || ([v37 containsObject:&unk_1ED97EA00] & 1) != 0) {
      [v37 addObjectsFromArray:v40];
    }
    else {
      [v37 addObject:&unk_1ED97EA00];
    }
    id v5 = v36;
    self->_wantsSystemSectionCollapsing = v44 > 1;
    if (![(MKTransitDeparturesDataProvider *)self allowsSystemSectionCollapsing]) {
      [(NSMutableSet *)self->_hiddenSections removeAllObjects];
    }
    if ([(MKTransitDeparturesDataProvider *)self _hasConnectionsSection]) {
      [v37 addObject:&unk_1ED97EA90];
    }
    [v37 addObject:&unk_1ED97EAA8];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __50__MKTransitDeparturesDataProvider_refreshSections__block_invoke;
    v47[3] = &unk_1E54BC9D8;
    v47[4] = self;
    v34 = [MEMORY[0x1E4F28F60] predicateWithBlock:v47];
    [v37 filterUsingPredicate:v34];

    objc_storeStrong((id *)&self->_sections, v37);
    v35 = [(MKTransitDeparturesDataProvider *)self delegate];
    [v35 transitDeparturesDataProviderDidReload:self];
  }
  else
  {
    if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:1]) {
      [v3 addObject:&unk_1ED97EA00];
    }
    objc_storeStrong((id *)&self->_sections, v3);
  }
}

uint64_t __50__MKTransitDeparturesDataProvider_refreshSections__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];

  return [v2 _isSectionTypeEnabled:v3];
}

- (void)reloadData
{
  [(NSMutableDictionary *)self->_sectionControllers removeAllObjects];

  [(MKTransitDeparturesDataProvider *)self refreshSections];
}

- (int64_t)numberOfSections
{
  return [(NSMutableArray *)self->_sections count];
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  int64_t v5 = 0;
  switch(-[MKTransitDeparturesDataProvider sectionTypeAtIndex:](self, "sectionTypeAtIndex:"))
  {
    case 1:
    case 8:
      return 1;
    case 2:
      uint64_t v8 = [(MKTransitDeparturesDataProvider *)self mapItem];
      uint64_t v9 = [v8 _transitInfo];
      uint64_t v10 = [v9 connections];
      int64_t v11 = [v10 count];

      return v11;
    case 3:
      uint64_t v13 = [(MKTransitDeparturesDataProvider *)self incidentsForIncidentsSection];
      int64_t v5 = [v13 count];

      return v5;
    case 4:
    case 7:
      v6 = [(MKTransitDeparturesDataProvider *)self _controllerForSection:a3];
      id v7 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
      if ([(MKTransitDeparturesDataProvider *)self isHidingDeparturesForSystem:v7])
      {

        return 0;
      }
      else
      {
        int64_t v14 = [v6 numberOfRows];

        return v14;
      }
    case 6:
      int64_t v15 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
      if ([(MKTransitDeparturesDataProvider *)self isHidingDeparturesForSystem:v15])
      {
        int64_t v5 = 0;
      }
      else
      {
        uint64_t v16 = [(MKTransitDeparturesDataProvider *)self incidentsForSystemIncidentsSection:v15];
        int64_t v5 = [v16 count];
      }
      return v5;
    default:
      return v5;
  }
}

- (int64_t)sectionTypeAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(MKTransitDeparturesDataProvider *)self numberOfSections] <= a3) {
    return 0;
  }
  int64_t v5 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (int64_t)indexOfFirstSectionWithType:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  sections = self->_sections;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MKTransitDeparturesDataProvider_indexOfFirstSectionWithType___block_invoke;
  v6[3] = &unk_1E54BCA00;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSMutableArray *)sections enumerateObjectsUsingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __63__MKTransitDeparturesDataProvider_indexOfFirstSectionWithType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 integerValue];
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_isSectionTypeEnabled:(int64_t)a3
{
  int64_t v4 = [(MKTransitDeparturesDataProvider *)self disabledSections];
  int64_t v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5] ^ 1;

  return v6;
}

- (id)_identifierForSection:(int64_t)a3
{
  switch(-[MKTransitDeparturesDataProvider sectionTypeAtIndex:](self, "sectionTypeAtIndex:"))
  {
    case 1:
      int64_t v5 = @"_mk_messageSection";
      break;
    case 2:
      int64_t v5 = @"_mk_connectionsSection";
      break;
    case 3:
      int64_t v5 = @"_mk_incidentsSection";
      break;
    case 4:
      char v6 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
      uint64_t v7 = NSString;
      uint64_t v8 = [v6 name];
      uint64_t v9 = [v6 muid];
      uint64_t v10 = [(MKTransitDeparturesDataProvider *)self directionForSection:a3];
      int64_t v5 = [v7 stringWithFormat:@"_mk_%@_%llu_%@_departure_section", v8, v9, v10];

      goto LABEL_10;
    case 5:
      char v6 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
      int64_t v5 = [(MKTransitDeparturesDataProvider *)self _identifierForSystem:v6];
      goto LABEL_11;
    case 6:
      int64_t v11 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
      uint64_t v12 = NSString;
      uint64_t v13 = [v11 name];
      int64_t v5 = [v12 stringWithFormat:@"_mk_%@_%llu_incidents", v13, objc_msgSend(v11, "muid")];

      break;
    case 7:
      char v6 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
      int64_t v14 = NSString;
      uint64_t v8 = [v6 name];
      uint64_t v15 = [v6 muid];
      lineLookupBySection = self->_lineLookupBySection;
      id v17 = [NSNumber numberWithInteger:a3];
      int v18 = [(NSDictionary *)lineLookupBySection objectForKeyedSubscript:v17];
      int64_t v5 = [v14 stringWithFormat:@"_mk_%@_%llu_%@_inactive_section", v8, v15, v18];

LABEL_10:
LABEL_11:

      break;
    case 8:
      int64_t v5 = @"_mk_attributionSection";
      break;
    default:
      int64_t v5 = &stru_1ED919588;
      break;
  }

  return v5;
}

- (int64_t)_sectionForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(MKTransitDeparturesDataProvider *)self numberOfSections] < 1)
  {
LABEL_5:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v5 = 0;
    while (1)
    {
      char v6 = [(MKTransitDeparturesDataProvider *)self _identifierForSection:v5];
      char v7 = [v6 isEqualToString:v4];

      if (v7) {
        break;
      }
      if (++v5 >= [(MKTransitDeparturesDataProvider *)self numberOfSections]) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

- (BOOL)isHidingDeparturesForSystem:(id)a3
{
  hiddenSections = self->_hiddenSections;
  id v4 = [(MKTransitDeparturesDataProvider *)self _identifierForSystem:a3];
  LOBYTE(hiddenSections) = [(NSMutableSet *)hiddenSections containsObject:v4];

  return (char)hiddenSections;
}

- (void)hideDeparturesForSystem:(id)a3 removedIndices:(id *)a4
{
  id v6 = a3;
  id v8 = [(MKTransitDeparturesDataProvider *)self _indexSetForHidingShowingSystem:v6];
  char v7 = [(MKTransitDeparturesDataProvider *)self _identifierForSystem:v6];

  [(NSMutableSet *)self->_hiddenSections addObject:v7];
  if (a4) {
    *a4 = v8;
  }
}

- (void)showDeparturesForSystem:(id)a3 insertedIndices:(id *)a4
{
  id v6 = a3;
  id v8 = [(MKTransitDeparturesDataProvider *)self _identifierForSystem:v6];
  -[NSMutableSet removeObject:](self->_hiddenSections, "removeObject:");
  char v7 = [(MKTransitDeparturesDataProvider *)self _indexSetForHidingShowingSystem:v6];

  if (a4) {
    *a4 = v7;
  }
}

- (id)_indexSetForHidingShowingSystem:(id)a3
{
  id v4 = [(MKTransitDeparturesDataProvider *)self _identifierForSystem:a3];
  unint64_t v5 = [(MKTransitDeparturesDataProvider *)self _sectionForIdentifier:v4] + 1;
  if (v5 >= [(NSMutableArray *)self->_sections count])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      char v7 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v5 + v6];
      uint64_t v8 = [v7 unsignedIntegerValue];

      if (v8 == 5) {
        break;
      }
      ++v6;
    }
    while (v5 + v6 < [(NSMutableArray *)self->_sections count]);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v5, v6);

  return v9;
}

- (BOOL)isLastSectionForSystem:(id)a3
{
  id v4 = [(MKTransitDeparturesDataProvider *)self _identifierForSystem:a3];
  int64_t v5 = [(MKTransitDeparturesDataProvider *)self _sectionForIdentifier:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    && ((v6 = v5, unint64_t v7 = v5 + 1, v5 < 0) || v7 < [(NSMutableArray *)self->_sections count])
    && (([(NSMutableArray *)self->_sections objectAtIndexedSubscript:v7],
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         uint64_t v9 = [v8 integerValue],
         v8,
         v9 != 7)
      ? (BOOL v10 = v9 == 4)
      : (BOOL v10 = 1),
        v10))
  {
    int64_t v11 = [(MKTransitDeparturesDataProvider *)self systemForSection:v6];
    uint64_t v12 = [(MKTransitDeparturesDataProvider *)self systemForSection:v7];
    BOOL v13 = v11 != v12;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)directionForSection:(int64_t)a3
{
  char v10 = 0;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = [(MKTransitDeparturesDataProvider *)self _systemForSection:a3 directionIndex:&v9];
  int64_t v5 = [(MKTransitDeparturesDataProvider *)self _directionsForSystem:v4 hasSequencesWithNoDirection:&v10];
  [v5 count];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
  int64_t v6 = 0;
  if ([v5 count])
  {
    unint64_t v8 = v9;
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (v10)
      {
        if (v8 == [v5 count]) {
          goto LABEL_2;
        }
        unint64_t v8 = v9;
      }
      if (v8 < [v5 count])
      {
        int64_t v6 = [v5 objectAtIndexedSubscript:v9];
        goto LABEL_3;
      }
LABEL_2:
      int64_t v6 = 0;
    }
  }
LABEL_3:

  return v6;
}

- (void)showNextPageInSection:(int64_t)a3
{
  id v4 = [(MKTransitDeparturesDataProvider *)self _identifierForSection:a3];
  if (v4)
  {
    int64_t v5 = v4;
    [(NSMutableSet *)self->_pagedSectionIdentifiers addObject:v4];
    id v4 = v5;
  }
}

- (void)setSelectedSystem:(id)a3
{
  int64_t v5 = (GEOTransitSystem *)a3;
  if (self->_selectedSystem != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_selectedSystem, a3);
    [(MKTransitDeparturesDataProvider *)self refreshSections];
    int64_t v5 = v6;
  }
}

- (id)_systemForSection:(int64_t)a3 directionIndex:(int64_t *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSMutableArray *)self->_sections indexOfObject:&unk_1ED97EA78];
  int64_t v7 = v6;
  if (a4) {
    *a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    v30[0] = self->_selectedSystem;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v22 = a4;
      uint64_t v11 = *(void *)v26;
      while (2)
      {
        uint64_t v12 = 0;
        int64_t v13 = v7;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          int64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
          if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:4]) {
            uint64_t v15 = [(MKTransitDeparturesDataProvider *)self _numberOfDeparturesSectionsForSystem:v14];
          }
          else {
            uint64_t v15 = 0;
          }
          if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:6])
          {
            uint64_t v16 = [(MKTransitDeparturesDataProvider *)self incidentsForSystemIncidentsSection:v14];
            BOOL v17 = [v16 count] != 0;
          }
          else
          {
            BOOL v17 = 0;
          }
          uint64_t v18 = v17 + v15;
          if ([(MKTransitDeparturesDataProvider *)self _isSectionTypeEnabled:7]
            && [(MKTransitDeparturesDataProvider *)self _systemHasInactiveLines:v14])
          {
            uint64_t v19 = [(MKTransitDeparturesDataProvider *)self _inactiveLinesForSystem:v14];
            v18 += [v19 count] + 1;
          }
          if (v18)
          {
            int64_t v7 = v13 + v18 + 1;
            if (v7 > a3)
            {
              if (v22)
              {
                if (v15 >= 1)
                {
                  int64_t v20 = ~(v17 + v13) + a3;
                  if (v20 >= 0) {
                    int64_t *v22 = v20;
                  }
                }
              }
              id v8 = v14;
              goto LABEL_31;
            }
          }
          else
          {
            int64_t v7 = v13;
          }
          ++v12;
          int64_t v13 = v7;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v8 = 0;
LABEL_31:
  }

  return v8;
}

- (id)systemForSection:(int64_t)a3
{
  return [(MKTransitDeparturesDataProvider *)self _systemForSection:a3 directionIndex:0];
}

- (id)_identifierForSystem:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  int64_t v5 = [v4 name];
  uint64_t v6 = [v4 muid];

  int64_t v7 = [v3 stringWithFormat:@"_mk_%@_%llu_system_section", v5, v6];

  return v7;
}

- (id)_directionsForSystem:(id)a3 hasSequencesWithNoDirection:(BOOL *)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(NSMapTable *)self->_cachedDirectionsForSystem objectForKey:v6];
  if (!v7)
  {
    id v8 = [(MKTransitDeparturesDataProvider *)self mapItem];
    uint64_t v9 = [v8 _transitInfo];
    uint64_t v10 = [(MKTransitDeparturesDataProvider *)self _blockedIncidentEntities];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__MKTransitDeparturesDataProvider__directionsForSystem_hasSequencesWithNoDirection___block_invoke;
    v15[3] = &unk_1E54BAE10;
    v15[4] = self;
    uint64_t v11 = [v9 departureSequenceContainersForSystem:v6 excludingIncidentEntities:v10 validForDateFromBlock:v15];

    if (v11)
    {
      v16[0] = @"kCachedDirectionsDirectionsKey";
      v16[1] = @"kCachedDirectionsNoDirectionKey";
      v17[0] = v11;
      uint64_t v12 = [NSNumber numberWithBool:0];
      v17[1] = v12;
      int64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

      [(NSMapTable *)self->_cachedDirectionsForSystem setObject:v7 forKey:v6];
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  if (a4) {
    *a4 = 1;
  }
  int64_t v13 = [v7 objectForKeyedSubscript:@"kCachedDirectionsDirectionsKey"];

  return v13;
}

uint64_t __84__MKTransitDeparturesDataProvider__directionsForSystem_hasSequencesWithNoDirection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _departureCutoffDateForSequence:a2];
}

- (NSArray)incidents
{
  return (NSArray *)[(MKTransitItemIncidentsController *)self->_incidentsController validIncidents];
}

- (id)incidentsForIncidentsSection
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)incidentsForSystemIncidentsSection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  incidentsController = self->_incidentsController;
  int64_t v7 = [(MKTransitDeparturesDataProvider *)self mapItem];
  id v8 = [(MKTransitItemIncidentsController *)incidentsController incidentsForMapItem:v7];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        int64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "muid"));
        [v5 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(MKTransitItemIncidentsController *)self->_incidentsController incidentsForSystem:v4];
  v31 = v4;
  uint64_t v29 = [(MKTransitItemIncidentsController *)self->_incidentsController incidentsForLinesInSystem:v4];
  v30 = v15;
  uint64_t v16 = [v15 arrayByAddingObjectsFromArray:v29];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        if ([v21 isBlockingIncident])
        {
          id v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "muid"));
          [v5 addObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v18);
  }
  uint64_t v23 = [(MKTransitItemIncidentsController *)self->_incidentsController validIncidents];
  uint64_t v24 = (void *)MEMORY[0x1E4F28F60];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __70__MKTransitDeparturesDataProvider_incidentsForSystemIncidentsSection___block_invoke;
  v32[3] = &unk_1E54BCA28;
  id v33 = v5;
  id v25 = v5;
  long long v26 = [v24 predicateWithBlock:v32];
  long long v27 = [v23 filteredArrayUsingPredicate:v26];

  return v27;
}

uint64_t __70__MKTransitDeparturesDataProvider_incidentsForSystemIncidentsSection___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a2, "muid"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)dominantIncidentForDepartureSequence:(id)a3
{
  uint64_t v3 = [(MKTransitItemIncidentsController *)self->_incidentsController incidentsForDepartureSequence:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (BOOL)_hasIncidentsSection
{
  v2 = [(MKTransitDeparturesDataProvider *)self incidentsForIncidentsSection];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isStuckWithExpiredInfo
{
  mapItemUpdater = self->_mapItemUpdater;
  BOOL v3 = [(MKTransitDeparturesDataProvider *)self departureCutoffDate];
  LOBYTE(mapItemUpdater) = [(MKTransitMapItemUpdater *)mapItemUpdater isStuckWithExpiredInfoRelativeToDate:v3];

  return (char)mapItemUpdater;
}

- (NSArray)sectionControllers
{
  return (NSArray *)[(NSMutableDictionary *)self->_sectionControllers allValues];
}

- (id)_controllerForSection:(int64_t)a3
{
  id v5 = -[MKTransitDeparturesDataProvider _identifierForSection:](self, "_identifierForSection:");
  id v6 = [(NSMutableDictionary *)self->_sectionControllers objectForKeyedSubscript:v5];
  if (v6) {
    goto LABEL_11;
  }
  int64_t v7 = [(MKTransitDeparturesDataProvider *)self sectionTypeAtIndex:a3];
  if (v7 == 7)
  {
    uint64_t v12 = [MKTransitInactiveLinesSectionController alloc];
    id v9 = [(MKTransitDeparturesDataProvider *)self mapItem];
    uint64_t v10 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
    lineLookupBySection = self->_lineLookupBySection;
    uint64_t v11 = [NSNumber numberWithInteger:a3];
    int64_t v14 = [(NSDictionary *)lineLookupBySection objectForKeyedSubscript:v11];
    id v6 = [(MKTransitInactiveLinesSectionController *)v12 initWithMapItem:v9 system:v10 line:v14];
  }
  else
  {
    if (v7 != 4)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    id v8 = [MKTransitDeparturesSectionController alloc];
    id v9 = [(MKTransitDeparturesDataProvider *)self mapItem];
    uint64_t v10 = [(MKTransitDeparturesDataProvider *)self systemForSection:a3];
    uint64_t v11 = [(MKTransitDeparturesDataProvider *)self directionForSection:a3];
    id v6 = [(MKTransitDeparturesSectionController *)v8 initWithMapItem:v9 system:v10 departureSequenceContainer:v11];
  }

LABEL_8:
  if ([(NSMutableSet *)self->_pagedSectionIdentifiers containsObject:v5]) {
    [(MKTransitSectionController *)v6 incrementPagingFilter];
  }
  [(NSMutableDictionary *)self->_sectionControllers setObject:v6 forKeyedSubscript:v5];
LABEL_11:
  uint64_t v15 = [(MKTransitDeparturesDataProvider *)self departureCutoffDate];
  [(MKTransitSectionController *)v6 setDepartureCutoffDate:v15];

  if ([(MKTransitDeparturesDataProvider *)self isStuckWithExpiredInfo])
  {
    uint64_t v16 = [(MKTransitDeparturesDataProvider *)self lastCutoffDateWithValidSchedule];
    [(MKTransitSectionController *)v6 setExpiredHighFrequencyCutoffDate:v16];
  }
  else
  {
    [(MKTransitSectionController *)v6 setExpiredHighFrequencyCutoffDate:0];
  }
  uint64_t v17 = [(MKTransitDeparturesDataProvider *)self _blockedIncidentEntities];
  [(MKTransitSectionController *)v6 setIncidentEntitiesToExclude:v17];

  return v6;
}

- (id)_identifierForSequence:(id)a3
{
  BOOL v3 = NSString;
  id v4 = a3;
  id v5 = [v4 line];
  id v6 = [v5 name];
  int64_t v7 = [v4 line];
  uint64_t v8 = [v7 muid];
  id v9 = [v4 direction];
  uint64_t v10 = [v4 headsign];

  uint64_t v11 = [v3 stringWithFormat:@"_mk_sequence_%@-%llu-%@-%@", v6, v8, v9, v10];

  return v11;
}

- (id)departuresControllerForSection:(int64_t)a3
{
  BOOL v3 = [(MKTransitDeparturesDataProvider *)self _controllerForSection:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (int64_t)departureSequenceFrequencyTypeForSection:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(MKTransitDeparturesDataProvider *)self numberOfSections] <= a3
    || [(MKTransitDeparturesDataProvider *)self sectionTypeAtIndex:a3] != 4)
  {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = -[MKTransitDeparturesDataProvider _departureSequencesForSection:](self, "_departureSequencesForSection:", a3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {

    return 1;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v16;
  int v9 = 1;
  int v10 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      v9 &= [v12 isLowFrequency] ^ 1;
      v10 &= [v12 isLowFrequency];
      if ((v9 & 1) == 0 && (v10 & 1) == 0)
      {

        return 3;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7) {
      continue;
    }
    break;
  }
  if (v10) {
    int64_t v13 = 2;
  }
  else {
    int64_t v13 = 3;
  }

  if (v9) {
    return 1;
  }
  return v13;
}

- (id)_departureSequencesForSection:(int64_t)a3
{
  BOOL v3 = [(MKTransitDeparturesDataProvider *)self departuresControllerForSection:a3];
  id v4 = [v3 sequences];

  return v4;
}

- (id)_departureCutoffDateForLine:(id)a3
{
  if (([a3 departuresAreVehicleSpecific] & 1) != 0
    || ![(MKTransitDeparturesDataProvider *)self isStuckWithExpiredInfo])
  {
    uint64_t v7 = [(MKTransitDeparturesDataProvider *)self departureCutoffDate];
  }
  else
  {
    id v4 = [(MKTransitDeparturesDataProvider *)self lastCutoffDateWithValidSchedule];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(MKTransitDeparturesDataProvider *)self departureCutoffDate];
    }
    uint64_t v7 = v6;
  }

  return v7;
}

- (id)_departureCutoffDateForSequence:(id)a3
{
  id v4 = [a3 line];
  id v5 = [(MKTransitDeparturesDataProvider *)self _departureCutoffDateForLine:v4];

  return v5;
}

- (int64_t)_numberOfDeparturesSectionsForSystem:(id)a3
{
  char v6 = 0;
  BOOL v3 = [(MKTransitDeparturesDataProvider *)self _directionsForSystem:a3 hasSequencesWithNoDirection:&v6];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)inactiveLinesForSection:(int64_t)a3
{
  BOOL v3 = [(MKTransitDeparturesDataProvider *)self _inactiveLinesControllerForSection:a3];
  int64_t v4 = [v3 inactiveLines];

  return v4;
}

- (id)_inactiveLinesControllerForSection:(int64_t)a3
{
  BOOL v3 = [(MKTransitDeparturesDataProvider *)self _controllerForSection:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_systemHasInactiveLines:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_cachedSystemHasInactiveLines objectForKey:v4];
  if (!v5)
  {
    char v6 = NSNumber;
    uint64_t v7 = [(MKTransitDeparturesDataProvider *)self _inactiveLinesForSystem:v4];
    id v5 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "count") != 0);

    [(NSMapTable *)self->_cachedSystemHasInactiveLines setObject:v5 forKey:v4];
  }
  char v8 = [v5 BOOLValue];

  return v8;
}

- (id)_inactiveLinesForSystem:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MKTransitDeparturesDataProvider *)self _blockedIncidentEntities];
  char v6 = [(MKTransitDeparturesDataProvider *)self mapItem];
  uint64_t v7 = [v6 _transitInfo];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __59__MKTransitDeparturesDataProvider__inactiveLinesForSystem___block_invoke;
  v27[3] = &unk_1E54BAE10;
  v27[4] = self;
  char v8 = [v7 inactiveLinesForSystem:v4 relativeToDateFromBlock:v27 excludingIncidentEntities:v5 usingContainers:1];

  if ([v8 count])
  {
    id v20 = v4;
    long long v21 = (void *)[v8 mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          int64_t v14 = [(MKTransitDeparturesDataProvider *)self mapItem];
          long long v15 = [v14 _transitInfo];
          long long v16 = [(MKTransitDeparturesDataProvider *)self _departureCutoffDateForLine:v13];
          long long v17 = [v15 serviceResumesResultForLine:v13 excludingIncidentEntities:v5 afterDate:v16 usingContainers:1];

          if (([v17 blocked] & 1) == 0)
          {
            long long v18 = [v17 earliestNextDepartureDate];

            if (!v18) {
              [v21 removeObject:v13];
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    char v8 = (void *)[v21 copy];
    id v4 = v20;
  }

  return v8;
}

uint64_t __59__MKTransitDeparturesDataProvider__inactiveLinesForSystem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _departureCutoffDateForSequence:a2];
}

- (BOOL)_hasConnectionsSection
{
  v2 = [(MKTransitDeparturesDataProvider *)self mapItem];
  BOOL v3 = [v2 _transitInfo];
  id v4 = [v3 connections];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)_hasPlaceCardMessageSection
{
  if ([(MKTransitDeparturesDataProvider *)self isStuckWithExpiredInfo]) {
    return 1;
  }
  id v4 = [(MKTransitDeparturesDataProvider *)self mapItem];
  BOOL v5 = [v4 _transitInfo];
  if (v5)
  {
    char v6 = [(MKTransitDeparturesDataProvider *)self mapItem];
    uint64_t v7 = [v6 _transitInfo];
    char v8 = [v7 systems];
    BOOL v3 = [v8 count] == 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_updateRefreshFailureErrorDescription
{
  if ([(MKTransitMapItemUpdater *)self->_mapItemUpdater lastInfoRefreshFailed])
  {
    switch(self->_lastFailureDiagnosis)
    {
      case 1:
        switch(MGGetSInt32Answer())
        {
          case 1u:
            BOOL v3 = @"TransitRefreshError_AirplaneMode_iPhone";
            break;
          case 2u:
            BOOL v3 = @"TransitRefreshError_AirplaneMode_iPod";
            break;
          case 3u:
            BOOL v3 = @"TransitRefreshError_AirplaneMode_iPad";
            break;
          case 6u:
            BOOL v3 = @"TransitRefreshError_AirplaneMode_Watch";
            break;
          default:
            BOOL v3 = @"TransitRefreshError_AirplaneMode_Device";
            break;
        }
        goto LABEL_10;
      case 2:
        BOOL v3 = @"TransitRefreshError_CellDataDisabled";
        goto LABEL_10;
      case 3:
        switch(MGGetSInt32Answer())
        {
          case 1u:
            BOOL v3 = @"TransitRefreshError_NoNetworkConnection_iPhone";
            break;
          case 2u:
            BOOL v3 = @"TransitRefreshError_NoNetworkConnection_iPod";
            break;
          case 3u:
            BOOL v3 = @"TransitRefreshError_NoNetworkConnection_iPad";
            break;
          case 6u:
            BOOL v3 = @"TransitRefreshError_NoNetworkConnection_Watch";
            break;
          default:
            BOOL v3 = @"TransitRefreshError_NoNetworkConnection_Device";
            break;
        }
        goto LABEL_10;
      case 4:
        BOOL v3 = @"TransitRefreshError_Generic";
LABEL_10:
        _MKLocalizedStringFromThisBundle(v3);
        BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        lastInfoRefreshErrorDescription = self->_lastInfoRefreshErrorDescription;
        self->_lastInfoRefreshErrorDescription = v5;
        goto LABEL_11;
      default:
        return;
    }
  }
  lastInfoRefreshErrorDescription = self->_lastInfoRefreshErrorDescription;
  self->_lastInfoRefreshErrorDescription = 0;
LABEL_11:
}

- (void)setDepartureCutoffDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_departureCutoffDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_departureCutoffDate, a3);
    [(NSMutableDictionary *)self->_cachedSequencesForSection removeAllObjects];
    [(NSMapTable *)self->_cachedDirectionsForSystem removeAllObjects];
    [(NSMapTable *)self->_cachedSystemHasInactiveLines removeAllObjects];
    [(MKTransitItemIncidentsController *)self->_incidentsController setReferenceDate:v5];
  }
}

- (NSDate)departureCutoffDate
{
  departureCutoffDate = self->_departureCutoffDate;
  if (!departureCutoffDate)
  {
    id v4 = +[MKTransitItemReferenceDateUpdater referenceDate];
    id v5 = self->_departureCutoffDate;
    self->_departureCutoffDate = v4;

    [(MKTransitItemIncidentsController *)self->_incidentsController setReferenceDate:self->_departureCutoffDate];
    departureCutoffDate = self->_departureCutoffDate;
  }

  return departureCutoffDate;
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  id v7 = a4;
  if ([(MKTransitDeparturesDataProvider *)self isStuckWithExpiredInfo])
  {
    id v5 = [(MKTransitDeparturesDataProvider *)self lastCutoffDateWithValidSchedule];

    if (!v5)
    {
      char v6 = [(MKTransitDeparturesDataProvider *)self departureCutoffDate];
      [(MKTransitDeparturesDataProvider *)self setLastCutoffDateWithValidSchedule:v6];
    }
  }
  else
  {
    [(MKTransitDeparturesDataProvider *)self setLastCutoffDateWithValidSchedule:0];
  }
  [(MKTransitDeparturesDataProvider *)self setDepartureCutoffDate:v7];
  [(MKTransitDeparturesDataProvider *)self reloadData];
}

- (id)ticketForTransitMapItemUpdater:(id)a3
{
  id v4 = [(MKTransitDeparturesDataProvider *)self delegate];
  id v5 = [v4 traitsForTransitDeparturesDataProvider:self];

  char v6 = [(MKMapItem *)self->_mapItem _identifier];
  id v7 = +[MKMapService sharedService];
  char v8 = [v7 ticketForFreshIdentifier:v6 resultProviderID:0 contentProvider:0 traits:v5];

  return v8;
}

- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    [(MKTransitItemIncidentsController *)self->_incidentsController resetCache];
    [(NSMapTable *)self->_cachedDirectionsForSystem removeAllObjects];
    [(NSMutableDictionary *)self->_cachedSequencesForSection removeAllObjects];
    [(NSMapTable *)self->_cachedSystemHasInactiveLines removeAllObjects];
  }
  self->_lastFailureDiagnosis = MKCurrentNetworkConnectionFailureDiagnosis();
  [(MKTransitDeparturesDataProvider *)self _updateRefreshFailureErrorDescription];
  self->_refreshing = 0;
  if ([(MKTransitDeparturesDataProvider *)self isActive]) {
    [(MKTransitDeparturesDataProvider *)self reloadData];
  }
}

- (id)possibleActions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(MKTransitDeparturesDataProvider *)self _hasIncidentsSection]) {
    [v3 addObject:&unk_1ED97EAC0];
  }
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSArray)connections
{
  v2 = [(MKMapItem *)self->_mapItem _transitInfo];
  BOOL v3 = [v2 connections];

  return (NSArray *)v3;
}

- (id)departuresSectionControllersForSystem:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_sections count])
  {
    unint64_t v5 = 0;
    do
    {
      char v6 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v5];
      if ([v6 integerValue] == 4)
      {
        id v7 = [(MKTransitDeparturesDataProvider *)self sectionControllerForSection:v5];
        [v4 addObject:v7];
      }
      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_sections count]);
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (id)inactiveLinesSectionControllersForSystem:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_sections count])
  {
    unint64_t v5 = 0;
    do
    {
      char v6 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v5];
      if ([v6 integerValue] == 7)
      {
        id v7 = [(MKTransitDeparturesDataProvider *)self sectionControllerForSection:v5];
        [v4 addObject:v7];
      }
      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_sections count]);
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (GEOTransitAttribution)transitAttribution
{
  return [(MKMapItem *)self->_mapItem _transitAttribution];
}

- (GEOAttribution)transitPunchoutAttribution
{
  v2 = [MEMORY[0x1E4F64918] modernManager];
  BOOL v3 = [v2 activeTileGroup];
  id v4 = [v3 attributions];
  unint64_t v5 = [v4 firstObject];

  return (GEOAttribution *)v5;
}

- (NSDate)lastCutoffDateWithValidSchedule
{
  return self->_lastCutoffDateWithValidSchedule;
}

- (void)setLastCutoffDateWithValidSchedule:(id)a3
{
}

- (GEOTransitSystem)selectedSystem
{
  return self->_selectedSystem;
}

- (MKTransitDeparturesDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKTransitDeparturesDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (NSString)lastInfoRefreshErrorDescription
{
  return self->_lastInfoRefreshErrorDescription;
}

- (NSArray)stationSystems
{
  return self->_stationSystems;
}

- (void)setDisabledSections:(id)a3
{
}

- (BOOL)supportsSystemSectionCollapsing
{
  return self->_supportSystemSectionCollapsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationSystems, 0);
  objc_storeStrong((id *)&self->_lastInfoRefreshErrorDescription, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedSystem, 0);
  objc_storeStrong((id *)&self->_lastCutoffDateWithValidSchedule, 0);
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
  objc_storeStrong((id *)&self->_lineLookupBySection, 0);
  objc_storeStrong((id *)&self->_mapItemUpdater, 0);
  objc_storeStrong((id *)&self->_cachedSystemHasInactiveLines, 0);
  objc_storeStrong((id *)&self->_cachedDirectionsForSystem, 0);
  objc_storeStrong((id *)&self->_cachedSequencesForSection, 0);
  objc_storeStrong((id *)&self->_pagedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenSections, 0);
  objc_storeStrong((id *)&self->_incidentsController, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_disabledSections, 0);
}

@end