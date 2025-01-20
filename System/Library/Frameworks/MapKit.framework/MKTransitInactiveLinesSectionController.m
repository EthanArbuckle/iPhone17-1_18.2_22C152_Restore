@interface MKTransitInactiveLinesSectionController
- (MKTransitInactiveLinesSectionController)init;
- (MKTransitInactiveLinesSectionController)initWithMapItem:(id)a3 system:(id)a4 line:(id)a5;
- (NSArray)inactiveLines;
- (id)_pagingFilter;
- (void)_buildRows;
- (void)_setNeedsBuildRows;
@end

@implementation MKTransitInactiveLinesSectionController

- (MKTransitInactiveLinesSectionController)init
{
  result = (MKTransitInactiveLinesSectionController *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MKTransitInactiveLinesSectionController)initWithMapItem:(id)a3 system:(id)a4 line:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MKTransitInactiveLinesSectionController;
  v10 = [(MKTransitSectionController *)&v13 initWithMapItem:a3 system:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_line, a5);
  }

  return v11;
}

- (NSArray)inactiveLines
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitInactiveLinesSectionController *)self _buildRows];
  }
  inactiveLines = self->_inactiveLines;

  return inactiveLines;
}

- (id)_pagingFilter
{
  pagingFilter = self->super.__pagingFilter;
  if (!pagingFilter)
  {
    v4 = +[MKTransitSectionPagingFilter defaultFilterForInactiveLines];
    v5 = self->super.__pagingFilter;
    self->super.__pagingFilter = v4;

    pagingFilter = self->super.__pagingFilter;
  }

  return pagingFilter;
}

- (void)_setNeedsBuildRows
{
  v4.receiver = self;
  v4.super_class = (Class)MKTransitInactiveLinesSectionController;
  [(MKTransitSectionController *)&v4 _setNeedsBuildRows];
  inactiveLines = self->_inactiveLines;
  self->_inactiveLines = 0;
}

- (void)_buildRows
{
  v2 = self;
  v46[1] = *MEMORY[0x1E4F143B8];
  if ([(MKTransitSectionController *)self _needsBuildRows])
  {
    v44.receiver = v2;
    v44.super_class = (Class)MKTransitInactiveLinesSectionController;
    [(MKTransitSectionController *)&v44 _buildRows];
    v3 = [(MKTransitInactiveLinesSectionController *)v2 _pagingFilter];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __53__MKTransitInactiveLinesSectionController__buildRows__block_invoke;
    v43[3] = &unk_1E54BA440;
    v43[4] = v2;
    objc_super v4 = (void (**)(void, void))MEMORY[0x18C139AE0](v43);
    if (v2->_line)
    {
      v46[0] = v2->_line;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    }
    else
    {
      v5 = 0;
    }
    v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    if ([v3 limitNumLines])
    {
      unint64_t v6 = [v5 count];
      BOOL v34 = v6 >= [v3 numLinesFallbackThreshold];
    }
    else
    {
      BOOL v34 = 0;
    }
    uint64_t v30 = [v3 numLinesFallbackValue];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v5;
    uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    v29 = v3;
    uint64_t v7 = 0;
    if (v38)
    {
      uint64_t v8 = *(void *)v40;
      v32 = v4;
      v33 = v2;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v11 = v4[2](v4, v10);
          v12 = [(MKMapItem *)v2->super._mapItem _transitInfo];
          objc_super v13 = [(MKTransitSectionController *)v2 incidentEntitiesToExclude];
          v14 = [v12 serviceResumesResultForLine:v10 excludingIncidentEntities:v13 afterDate:v11 usingContainers:1];

          uint64_t v15 = [v14 blocked];
          uint64_t v16 = [v14 earliestNextDepartureDate];
          v17 = (void *)v16;
          if ((v15 & 1) != 0 || v16)
          {
            if (!v34 || [v36 count] != v30)
            {
              v18 = [_MKTransitInactiveLine alloc];
              uint64_t v37 = v7;
              if (v15) {
                v19 = 0;
              }
              else {
                v19 = v17;
              }
              v20 = [(MKMapItem *)v2->super._mapItem timeZone];
              v21 = [v14 departureSequence];
              v22 = v18;
              uint64_t v8 = v31;
              v23 = [(_MKTransitInactiveLine *)v22 initWithTransitLine:v10 blocked:v15 serviceResumesDate:v19 timeZone:v20 referenceDate:v11 departuresSequence:v21];
              [v36 addObject:v23];

              uint64_t v7 = v37;
              objc_super v4 = v32;

              v2 = v33;
            }
          }
          else
          {
            ++v7;
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v38);
    }

    uint64_t v24 = [obj count];
    v2->super._numberOfFilteredLines = v24 - v7 - [v36 count];
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v36];
    inactiveLines = v2->_inactiveLines;
    v2->_inactiveLines = (NSArray *)v25;

    v2->super._numberOfRows = [(NSArray *)v2->_inactiveLines count];
    uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithArray:obj];
    linesToShow = v2->super._linesToShow;
    v2->super._linesToShow = (NSSet *)v27;
  }
}

id __53__MKTransitInactiveLinesSectionController__buildRows__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) expiredHighFrequencyCutoffDate];
  if (v4 && ![v3 departuresAreVehicleSpecific])
  {
    uint64_t v5 = [*(id *)(a1 + 32) expiredHighFrequencyCutoffDate];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) departureCutoffDate];
  }
  unint64_t v6 = (void *)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveLines, 0);

  objc_storeStrong((id *)&self->_line, 0);
}

@end