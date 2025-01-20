@interface MKTransitDeparturesSectionController
- (BOOL)_isDateLastDeparture:(id)a3 withNextDepartureDate:(id)a4 forSequence:(id)a5;
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)showOperatingHours;
- (MKTransitDepartureServiceGapFormatter)serviceGapFormatter;
- (MKTransitDeparturesSectionController)init;
- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4;
- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4 departureSequenceContainer:(id)a5;
- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4 direction:(id)a5;
- (id)_nextLastDepartureDateForSequence:(id)a3 afterDate:(id)a4;
- (id)_pagingFilter;
- (id)sequenceForRow:(int64_t)a3 outIsNewLine:(BOOL *)a4 outNextLineIsSame:(BOOL *)a5;
- (id)sequences;
- (id)serviceGapDescriptionForRow:(int64_t)a3;
- (void)_buildRows;
- (void)_serviceGapDate:(id *)a3 string:(id *)a4 forSequence:(id)a5 withDepartureIndex:(unint64_t)a6;
- (void)_setNeedsBuildRows;
- (void)_sharedSetup;
- (void)setDepartureCutoffDate:(id)a3;
- (void)setServiceGapFormatter:(id)a3;
@end

@implementation MKTransitDeparturesSectionController

- (MKTransitDeparturesSectionController)init
{
  result = (MKTransitDeparturesSectionController *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4
{
  return [(MKTransitDeparturesSectionController *)self initWithMapItem:a3 system:a4 departureSequenceContainer:0];
}

- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4 direction:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MKTransitDeparturesSectionController;
  v9 = [(MKTransitSectionController *)&v13 initWithMapItem:a3 system:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    direction = v9->_direction;
    v9->_direction = (NSString *)v10;

    [(MKTransitDeparturesSectionController *)v9 _sharedSetup];
  }

  return v9;
}

- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4 departureSequenceContainer:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MKTransitDeparturesSectionController;
  uint64_t v10 = [(MKTransitSectionController *)&v13 initWithMapItem:a3 system:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_departureSequenceContainer, a5);
    [(MKTransitDeparturesSectionController *)v11 _sharedSetup];
  }

  return v11;
}

- (void)_sharedSetup
{
  self->_needsFindDeparturesAreVehicleSpecific = 1;
  self->_needsFindRowForServiceGap = 1;
}

- (BOOL)departuresAreVehicleSpecific
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_needsFindDeparturesAreVehicleSpecific)
  {
    self->_needsFindDeparturesAreVehicleSpecific = 0;
    v3 = [(MKMapItem *)self->super._mapItem _transitInfo];
    v4 = [(MKTransitSectionController *)self system];
    v5 = [v3 allSequencesForSystem:v4 container:self->_departureSequenceContainer];

    self->_departuresAreVehicleSpecific = 1;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "line", (void)v14);
          char v12 = [v11 departuresAreVehicleSpecific];

          if ((v12 & 1) == 0)
          {
            self->_departuresAreVehicleSpecific = 0;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return self->_departuresAreVehicleSpecific;
}

- (id)sequences
{
  sequences = self->_sequences;
  if (!sequences)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__MKTransitDeparturesSectionController_sequences__block_invoke;
    v11[3] = &unk_1E54BAE10;
    v11[4] = self;
    v4 = (void *)MEMORY[0x18C139AE0](v11, a2);
    v5 = [(MKMapItem *)self->super._mapItem _transitInfo];
    id v6 = [(MKTransitSectionController *)self system];
    uint64_t v7 = [(MKTransitSectionController *)self incidentEntitiesToExclude];
    uint64_t v8 = [v5 departureSequencesForSystem:v6 excludingIncidentEntities:v7 container:self->_departureSequenceContainer validForDateFromBlock:v4];
    uint64_t v9 = self->_sequences;
    self->_sequences = v8;

    sequences = self->_sequences;
  }

  return sequences;
}

id __49__MKTransitDeparturesSectionController_sequences__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) expiredHighFrequencyCutoffDate];
  if (v2 && ![*(id *)(a1 + 32) departuresAreVehicleSpecific])
  {
    uint64_t v3 = [*(id *)(a1 + 32) expiredHighFrequencyCutoffDate];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) departureCutoffDate];
  }
  v4 = (void *)v3;

  return v4;
}

- (id)sequenceForRow:(int64_t)a3 outIsNewLine:(BOOL *)a4 outNextLineIsSame:(BOOL *)a5
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitDeparturesSectionController *)self _buildRows];
  }
  uint64_t v9 = [(MKTransitDeparturesSectionController *)self sequences];
  if (![v9 count])
  {
    BOOL v12 = 0;
    long long v16 = 0;
    v25 = 0;
    char v26 = 1;
    if (a4) {
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v29 = a4;
  v30 = a5;
  int64_t v10 = 0;
  v11 = 0;
  BOOL v12 = 0;
  unint64_t v13 = 1;
  char v32 = 1;
  while (1)
  {
    long long v14 = [v9 objectAtIndexedSubscript:v13 - 1];
    long long v15 = [(NSMapTable *)self->_sequencesToInclude objectForKey:v14];

    if (v15) {
      break;
    }
LABEL_20:

    if (v13++ >= [v9 count])
    {
      v25 = 0;
      long long v16 = v11;
      goto LABEL_26;
    }
  }
  long long v16 = [v14 line];
  BOOL v18 = 1;
  if (v11)
  {
    uint64_t v17 = [v11 muid];
    if (v17 == [v16 muid]) {
      BOOL v18 = 0;
    }
  }
  char v32 = v18;
  if (v10 != a3)
  {
    ++v10;

    v11 = v16;
    goto LABEL_20;
  }
  id v19 = v14;
  if (v13 == [v9 count])
  {
    BOOL v12 = 0;
  }
  else
  {
    v20 = [(MKTransitDeparturesSectionController *)self sequenceForRow:a3 + 1 outIsNewLine:0 outNextLineIsSame:0];
    v21 = v20;
    if (v20)
    {
      [v20 line];
      v22 = id v31 = v19;
      uint64_t v23 = [v22 muid];
      BOOL v12 = v23 == [v16 muid];

      id v19 = v31;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  if (!v19)
  {
    v11 = v16;
    int64_t v10 = a3;
    goto LABEL_20;
  }
  v25 = v19;

LABEL_26:
  a4 = v29;
  a5 = v30;
  char v26 = v32;
  if (v29) {
LABEL_27:
  }
    *a4 = v26 & 1;
LABEL_28:
  if (a5) {
    *a5 = v12;
  }
  id v27 = v25;

  return v27;
}

- (BOOL)showOperatingHours
{
  v2 = [(MKTransitDeparturesSectionController *)self sequences];
  uint64_t v3 = [v2 firstObject];

  LOBYTE(v2) = [v3 departureTimeDisplayStyle] == 3;
  return (char)v2;
}

- (id)_pagingFilter
{
  pagingFilter = self->super.__pagingFilter;
  if (!pagingFilter)
  {
    v4 = +[MKTransitSectionPagingFilter defaultFilterForDepartures];
    v5 = self->super.__pagingFilter;
    self->super.__pagingFilter = v4;

    pagingFilter = self->super.__pagingFilter;
  }

  return pagingFilter;
}

- (void)_setNeedsBuildRows
{
  v5.receiver = self;
  v5.super_class = (Class)MKTransitDeparturesSectionController;
  [(MKTransitSectionController *)&v5 _setNeedsBuildRows];
  sequences = self->_sequences;
  self->_sequences = 0;

  serviceGapStrings = self->_serviceGapStrings;
  self->_serviceGapStrings = 0;

  self->_needsFindRowForServiceGap = 1;
}

- (void)_buildRows
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if ([(MKTransitSectionController *)self _needsBuildRows])
  {
    v86.receiver = self;
    v86.super_class = (Class)MKTransitDeparturesSectionController;
    [(MKTransitSectionController *)&v86 _buildRows];
    v38 = [(MKTransitDeparturesSectionController *)self sequences];
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sequencesToInclude = self->_sequencesToInclude;
    self->_sequencesToInclude = v3;

    v39 = [(MKTransitDeparturesSectionController *)self _pagingFilter];
    uint64_t v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__15;
    v84 = __Block_byref_object_dispose__15;
    id v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v38, "count"));
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x2020000000;
    uint64_t v79 = 0;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x3032000000;
    v74[3] = __Block_byref_object_copy__15;
    v74[4] = __Block_byref_object_dispose__15;
    id v75 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__15;
    v72 = __Block_byref_object_dispose__15;
    id v73 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__15;
    v66 = __Block_byref_object_dispose__15;
    id v67 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __50__MKTransitDeparturesSectionController__buildRows__block_invoke;
    v61[3] = &unk_1E54BAE10;
    v61[4] = self;
    v36 = (void *)MEMORY[0x18C139AE0](v61);
    int v5 = [v39 limitNumLines];
    uint64_t v6 = [v39 numLinesFallbackValue];
    if (v5)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v7 = v38;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v89 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v58;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v58 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            uint64_t v12 = [(id)v81[5] count];
            if (v12 == [v39 numLinesFallbackThreshold])
            {
              LOBYTE(v5) = 1;
              goto LABEL_13;
            }
            unint64_t v13 = (void *)v81[5];
            long long v14 = [v11 line];
            [v13 addObject:v14];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v89 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v5) = 0;
LABEL_13:

      [(id)v81[5] removeAllObjects];
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __50__MKTransitDeparturesSectionController__buildRows__block_invoke_2;
    v48[3] = &unk_1E54BAE38;
    id v37 = v36;
    v48[4] = self;
    id v49 = v37;
    v50 = v74;
    v51 = &v68;
    char v56 = v5;
    v52 = &v62;
    v53 = &v80;
    v54 = &v76;
    uint64_t v55 = v6;
    [v38 enumerateObjectsUsingBlock:v48];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v16 = [(MKTransitDeparturesSectionController *)self sequences];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v88 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          v21 = [(NSMapTable *)self->_sequencesToInclude objectForKey:v20];

          if (v21)
          {
            v22 = [v20 line];
            [v15 addObject:v22];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v88 count:16];
      }
      while (v17);
    }

    uint64_t v23 = (NSSet *)[v15 copy];
    linesToShow = self->super._linesToShow;
    self->super._linesToShow = v23;

    v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v69[5], "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    char v26 = [(id)v69[5] keyEnumerator];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v87 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v41;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * k);
          id v31 = [(id)v69[5] objectForKey:v30];
          char v32 = [(id)v63[5] objectForKey:v30];
          v33 = (void *)[v31 copy];
          [v25 setObject:v33 forKeyedSubscript:v32];
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v87 count:16];
      }
      while (v27);
    }

    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v25];
    serviceGapStrings = self->_serviceGapStrings;
    self->_serviceGapStrings = v34;

    self->super._numberOfRows = v77[3];
    _Block_object_dispose(&v62, 8);

    _Block_object_dispose(&v68, 8);
    _Block_object_dispose(v74, 8);

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(&v80, 8);
  }
}

id __50__MKTransitDeparturesSectionController__buildRows__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) expiredHighFrequencyCutoffDate];
  if (v2 && ![*(id *)(a1 + 32) departuresAreVehicleSpecific])
  {
    uint64_t v3 = [*(id *)(a1 + 32) expiredHighFrequencyCutoffDate];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) departureCutoffDate];
  }
  v4 = (void *)v3;

  return v4;
}

void __50__MKTransitDeparturesSectionController__buildRows__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v7 = [v5 departuresValidForDate:v6];

  uint64_t v8 = [v5 line];
  uint64_t v9 = *(void **)(a1 + 32);
  id v24 = 0;
  id v25 = 0;
  [v9 _serviceGapDate:&v25 string:&v24 forSequence:v5 withDepartureIndex:0];
  id v10 = v25;
  id v11 = v24;
  uint64_t v12 = v11;
  if (v10)
  {
    if (v11)
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:v8];
      if (!v13) {
        goto LABEL_5;
      }
      long long v14 = (void *)v13;
      id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:v8];
      id v16 = [v15 laterDate:v10];

      if (v16 == v10)
      {
LABEL_5:
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v10 forKey:v8];
        uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v18 = (void *)[v12 copy];
        [v17 setObject:v18 forKey:v8];

        id v19 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v20 = [NSNumber numberWithUnsignedInteger:a3];
        [v19 setObject:v20 forKey:v8];
      }
    }
  }
  if (*(unsigned char *)(a1 + 96)
    && [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count] == *(void *)(a1 + 88))
  {
    ++*(void *)(*(void *)(a1 + 32) + 48);
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v8];
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v21 = objc_alloc_init(_MKSortedDepartureCollection);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v5, 0);
    [(_MKSortedDepartureCollection *)v21 setGroupedSequences:v22];

    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
    [(_MKSortedDepartureCollection *)v21 setSortedDepartures:v23];

    [*(id *)(*(void *)(a1 + 32) + 120) setObject:v21 forKey:v5];
  }
}

- (MKTransitDepartureServiceGapFormatter)serviceGapFormatter
{
  serviceGapFormatter = self->_serviceGapFormatter;
  if (!serviceGapFormatter)
  {
    v4 = [MKTransitDepartureServiceGapFormatter alloc];
    id v5 = [(MKMapItem *)self->super._mapItem timeZone];
    uint64_t v6 = [(MKTransitSectionController *)self departureCutoffDate];
    id v7 = [(MKTransitDepartureServiceGapFormatter *)v4 initWithTimeZone:v5 departureCutoffDate:v6];
    uint64_t v8 = self->_serviceGapFormatter;
    self->_serviceGapFormatter = v7;

    serviceGapFormatter = self->_serviceGapFormatter;
  }

  return serviceGapFormatter;
}

- (void)setDepartureCutoffDate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKTransitDeparturesSectionController;
  [(MKTransitSectionController *)&v5 setDepartureCutoffDate:a3];
  serviceGapFormatter = self->_serviceGapFormatter;
  self->_serviceGapFormatter = 0;
}

- (BOOL)_isDateLastDeparture:(id)a3 withNextDepartureDate:(id)a4 forSequence:(id)a5
{
  id v8 = a5;
  if (a4)
  {
    id v9 = a3;
    char v10 = [v8 isDepartureDateInactive:a4 withReferenceDate:v9];
  }
  else
  {
    mapItem = self->super._mapItem;
    id v12 = a3;
    uint64_t v13 = [(MKMapItem *)mapItem _transitInfo];
    id v9 = [v13 lastFullScheduleValidDate];

    [v9 timeIntervalSinceDate:v12];
    double v15 = v14;

    if (v15 >= 0.0)
    {
      char v10 = 1;
    }
    else
    {
      unint64_t v16 = [v8 numberOfDeparturesAfterDate:v9];
      uint64_t v17 = [(MKMapItem *)self->super._mapItem _transitInfo];
      char v10 = v16 < [v17 numAdditionalDeparturesForSequence:v8];
    }
  }

  return v10;
}

- (id)_nextLastDepartureDateForSequence:(id)a3 afterDate:(id)a4
{
  id v6 = a3;
  id v7 = [v6 firstDepartureAfterDate:a4];
  id v8 = [v7 departureDate];

  id v9 = [v6 firstDepartureAfterDate:v8];
  char v10 = [v9 departureDate];

  if (v8)
  {
    while (![(MKTransitDeparturesSectionController *)self _isDateLastDeparture:v8 withNextDepartureDate:v10 forSequence:v6])
    {
      id v11 = v10;

      id v12 = [v6 firstDepartureAfterDate:v11];
      char v10 = [v12 departureDate];

      id v8 = v11;
      if (!v11) {
        goto LABEL_4;
      }
    }
    id v13 = v8;
  }
  else
  {
LABEL_4:
    id v13 = 0;
  }

  return v13;
}

- (void)_serviceGapDate:(id *)a3 string:(id *)a4 forSequence:(id)a5 withDepartureIndex:(unint64_t)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([v9 departureTimeDisplayStyle] == 5)
  {
    if (a3) {
      *a3 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_46;
  }
  long long v60 = a3;
  char v10 = [(MKTransitSectionController *)self expiredHighFrequencyCutoffDate];
  if (v10
    && ![(MKTransitDeparturesSectionController *)self departuresAreVehicleSpecific])
  {
    uint64_t v11 = [(MKTransitSectionController *)self expiredHighFrequencyCutoffDate];
  }
  else
  {
    uint64_t v11 = [(MKTransitSectionController *)self departureCutoffDate];
  }
  id v12 = (void *)v11;
  id v13 = [v9 departuresValidForDate:v11];

  double v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v62 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v21 = [v20 departureDate];

        if (v21)
        {
          v22 = [v20 departureDate];
          [v14 addObject:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v17);
  }

  uint64_t v23 = [(MKTransitSectionController *)self departureCutoffDate];
  id v24 = +[MKTransitDeparturesCell displayableCountdowDepartureDatesFromDates:v14 withReferenceDate:v23];

  id v25 = [v24 lastObject];
  if (v25)
  {
    char v26 = [v9 firstDepartureAfterDate:v25];
    uint64_t v27 = [v26 departureDate];
    BOOL v28 = [(MKTransitDeparturesSectionController *)self _isDateLastDeparture:v25 withNextDepartureDate:v27 forSequence:v9];

    long long v59 = v26;
    if (v28)
    {
      id v29 = v25;
      long long v57 = a4;
      if ([v24 count] != 1)
      {
        id v40 = [(MKTransitDeparturesSectionController *)self serviceGapFormatter];
        uint64_t v41 = [v40 lastDepartureAtStringFromDate:v29];
LABEL_31:
        char v32 = (void *)v41;
        goto LABEL_32;
      }
      uint64_t v30 = [(MKTransitDeparturesSectionController *)self serviceGapFormatter];
      id v40 = v30;
      if (!v26)
      {
        uint64_t v41 = [v30 lastDepartureString];
        goto LABEL_31;
      }
      id v31 = [v26 departureDate];
      char v32 = [v40 lastDepartureUntilStringFromDate:v31];
    }
    else
    {
      v34 = [v26 departureDate];
      v35 = [(MKTransitDeparturesSectionController *)self _nextLastDepartureDateForSequence:v9 afterDate:v34];

      if (!v35
        || ([(MKTransitSectionController *)self departureCutoffDate],
            v36 = objc_claimAutoreleasedReturnValue(),
            [v35 timeIntervalSinceDate:v36],
            double v38 = v37,
            v36,
            v38 >= 3600.0))
      {
        id v29 = 0;
        long long v58 = 0;
        v33 = 0;
        goto LABEL_36;
      }
      long long v57 = a4;
      id v40 = v35;
      v39 = [(MKTransitDeparturesSectionController *)self serviceGapFormatter];
      char v32 = [v39 lastDepartureAtStringFromDate:v40];

      id v29 = v40;
    }
LABEL_32:

    if (!v32)
    {
      long long v58 = 0;
      v33 = 0;
      a4 = v57;
      goto LABEL_38;
    }
    id v55 = v29;
    char v56 = v24;
    id v42 = objc_alloc(MEMORY[0x1E4F28E48]);
    long long v58 = v32;
    long long v43 = [v32 formattedString];
    v33 = (void *)[v42 initWithString:v43];

    long long v44 = [(MKTransitDeparturesSectionController *)self serviceGapFormatter];
    long long v45 = [v44 lastDepartureString];
    v35 = [v45 formattedString];

    long long v46 = [v33 string];
    long long v47 = [v46 lowercaseString];
    v48 = [v35 lowercaseString];
    uint64_t v49 = [v47 rangeOfString:v48];
    uint64_t v54 = v50;

    if (v49 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v51 = *MEMORY[0x1E4F42508];
      v52 = +[MKTransitDeparturesCell strongSecondaryFont];
      objc_msgSend(v33, "addAttribute:value:range:", v51, v52, v49, v54);
    }
    id v24 = v56;
    a4 = v57;
    id v29 = v55;
LABEL_36:

LABEL_38:
    goto LABEL_39;
  }
  v33 = 0;
  id v29 = 0;
LABEL_39:
  if (v60) {
    *long long v60 = v29;
  }
  if (a4)
  {
    if (v33)
    {
      id v53 = (id) [v33 copy];
      *a4 = v53;
    }
    else
    {
      *a4 = 0;
    }
  }

LABEL_46:
}

- (id)serviceGapDescriptionForRow:(int64_t)a3
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitDeparturesSectionController *)self _buildRows];
  }
  serviceGapStrings = self->_serviceGapStrings;
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(NSDictionary *)serviceGapStrings objectForKey:v6];

  return v7;
}

- (void)setServiceGapFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGapFormatter, 0);
  objc_storeStrong((id *)&self->_serviceGapStrings, 0);
  objc_storeStrong((id *)&self->_sequencesToInclude, 0);
  objc_storeStrong((id *)&self->_sequences, 0);
  objc_storeStrong((id *)&self->_departureSequenceContainer, 0);

  objc_storeStrong((id *)&self->_direction, 0);
}

@end