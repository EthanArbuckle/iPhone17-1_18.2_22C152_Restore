@interface MKTransitSectionController
- (BOOL)_needsBuildRows;
- (BOOL)hasFilteredLines;
- (BOOL)hasFilteredRows;
- (GEOTransitSystem)system;
- (MKTransitSectionController)init;
- (MKTransitSectionController)initWithMapItem:(id)a3 system:(id)a4;
- (MKTransitSectionPagingFilter)_pagingFilter;
- (NSDate)departureCutoffDate;
- (NSDate)expiredHighFrequencyCutoffDate;
- (NSSet)incidentEntitiesToExclude;
- (id)linesToShow;
- (unint64_t)numberOfFilteredLines;
- (unint64_t)numberOfRows;
- (void)_buildRows;
- (void)_setNeedsBuildRows;
- (void)incrementPagingFilter;
- (void)setDepartureCutoffDate:(id)a3;
- (void)setExpiredHighFrequencyCutoffDate:(id)a3;
- (void)setIncidentEntitiesToExclude:(id)a3;
@end

@implementation MKTransitSectionController

- (MKTransitSectionController)init
{
  result = (MKTransitSectionController *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MKTransitSectionController)initWithMapItem:(id)a3 system:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKTransitSectionController;
  v9 = [(MKTransitSectionController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_system, a4);
    v10->_needsBuildRows = 1;
  }

  return v10;
}

- (void)setDepartureCutoffDate:(id)a3
{
  v5 = (NSDate *)a3;
  departureCutoffDate = self->_departureCutoffDate;
  if (departureCutoffDate != v5)
  {
    id v8 = v5;
    BOOL v7 = [(NSDate *)departureCutoffDate isEqualToDate:v5];
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_departureCutoffDate, a3);
      [(MKTransitSectionController *)self _setNeedsBuildRows];
      v5 = v8;
    }
  }
}

- (void)setExpiredHighFrequencyCutoffDate:(id)a3
{
  v5 = (NSDate *)a3;
  expiredHighFrequencyCutoffDate = self->_expiredHighFrequencyCutoffDate;
  if (expiredHighFrequencyCutoffDate != v5)
  {
    id v8 = v5;
    BOOL v7 = [(NSDate *)expiredHighFrequencyCutoffDate isEqualToDate:v5];
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_expiredHighFrequencyCutoffDate, a3);
      [(MKTransitSectionController *)self _setNeedsBuildRows];
      v5 = v8;
    }
  }
}

- (void)setIncidentEntitiesToExclude:(id)a3
{
  v5 = (NSSet *)a3;
  incidentEntitiesToExclude = self->_incidentEntitiesToExclude;
  if (incidentEntitiesToExclude != v5)
  {
    id v8 = v5;
    BOOL v7 = [(NSSet *)incidentEntitiesToExclude isEqualToSet:v5];
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_incidentEntitiesToExclude, a3);
      [(MKTransitSectionController *)self _setNeedsBuildRows];
      v5 = v8;
    }
  }
}

- (void)incrementPagingFilter
{
  v3 = [(MKTransitSectionController *)self _pagingFilter];
  [v3 setLimitNumLines:0];

  [(MKTransitSectionController *)self _setNeedsBuildRows];
}

- (unint64_t)numberOfRows
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitSectionController *)self _buildRows];
  }
  return self->_numberOfRows;
}

- (BOOL)hasFilteredRows
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitSectionController *)self _buildRows];
  }
  return self->_numberOfFilteredRows || self->_numberOfFilteredLines != 0;
}

- (BOOL)hasFilteredLines
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitSectionController *)self _buildRows];
  }
  return self->_numberOfFilteredLines != 0;
}

- (id)linesToShow
{
  if ([(MKTransitSectionController *)self _needsBuildRows]) {
    [(MKTransitSectionController *)self _buildRows];
  }
  linesToShow = self->_linesToShow;

  return linesToShow;
}

- (BOOL)_needsBuildRows
{
  return self->_needsBuildRows;
}

- (void)_setNeedsBuildRows
{
  self->_needsBuildRows = 1;
}

- (void)_buildRows
{
  v3 = [(MKTransitSectionController *)self departureCutoffDate];

  if (v3)
  {
    self->_numberOfFilteredRows = 0;
    self->_numberOfFilteredLines = 0;
    self->_needsBuildRows = 0;
  }
}

- (GEOTransitSystem)system
{
  return self->_system;
}

- (NSDate)departureCutoffDate
{
  return self->_departureCutoffDate;
}

- (NSDate)expiredHighFrequencyCutoffDate
{
  return self->_expiredHighFrequencyCutoffDate;
}

- (NSSet)incidentEntitiesToExclude
{
  return self->_incidentEntitiesToExclude;
}

- (unint64_t)numberOfFilteredLines
{
  return self->_numberOfFilteredLines;
}

- (MKTransitSectionPagingFilter)_pagingFilter
{
  return self->__pagingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentEntitiesToExclude, 0);
  objc_storeStrong((id *)&self->_expiredHighFrequencyCutoffDate, 0);
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_linesToShow, 0);
  objc_storeStrong((id *)&self->__pagingFilter, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end