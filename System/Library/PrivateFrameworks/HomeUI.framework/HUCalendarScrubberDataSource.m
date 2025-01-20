@interface HUCalendarScrubberDataSource
- (BOOL)eventExistsForItemAtIndexPath:(id)a3;
- (BOOL)eventExistsOnDate:(id)a3;
- (HMCameraClipManager)clipManager;
- (HUCalendarScrubberDataSource)init;
- (HUCalendarScrubberDataSource)initWithCameraClipManager:(id)a3 datesWithClips:(id)a4;
- (NSArray)dates;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSHashTable)changeObservers;
- (NSSet)datesWithClips;
- (id)dateAtIndexPath:(id)a3;
- (id)dayOfWeekForItemAtIndexPath:(id)a3;
- (id)indexPathForDate:(id)a3;
- (id)shortMonthNameForItemAtIndexPath:(id)a3;
- (int64_t)dayOfMonthForItemAtIndexPath:(id)a3;
- (unint64_t)totalNumberOfWeeks;
- (void)_updateDateBoundariesIfNeeded;
- (void)addChangeObserver:(id)a3;
- (void)reloadDates;
- (void)removeChangeObserver:(id)a3;
- (void)setChangeObservers:(id)a3;
- (void)setClipManager:(id)a3;
- (void)setDates:(id)a3;
- (void)setDatesWithClips:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)updateDatesWithClips:(id)a3;
@end

@implementation HUCalendarScrubberDataSource

- (HUCalendarScrubberDataSource)initWithCameraClipManager:(id)a3 datesWithClips:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUCalendarScrubberDataSource;
  v8 = [(HUCalendarScrubberDataSource *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clipManager, v6);
    if (v7)
    {
      v10 = (NSSet *)v7;
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CAD0] set];
    }
    datesWithClips = v9->_datesWithClips;
    v9->_datesWithClips = v10;

    [(HUCalendarScrubberDataSource *)v9 reloadDates];
    [(HUCalendarScrubberDataSource *)v9 _updateDateBoundariesIfNeeded];
    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v9->_changeObservers;
    v9->_changeObservers = (NSHashTable *)v12;
  }
  return v9;
}

- (HUCalendarScrubberDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCameraClipManager_datesWithClips_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCalendarScrubberDataSource.m", 46, @"%s is unavailable; use %@ instead",
    "-[HUCalendarScrubberDataSource init]",
    v5);

  return 0;
}

- (void)_updateDateBoundariesIfNeeded
{
  if (!self->_startDate)
  {
    v3 = [(NSArray *)self->_dates firstObject];
    objc_msgSend(v3, "hf_startOfWeek");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v4;
  }
  if (!self->_endDate)
  {
    id v8 = [(NSArray *)self->_dates lastObject];
    objc_msgSend(v8, "hf_endOfWeek");
    id v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v6;
  }
}

- (BOOL)eventExistsForItemAtIndexPath:(id)a3
{
  v3 = self;
  v4 = [(HUCalendarScrubberDataSource *)self dateAtIndexPath:a3];
  LOBYTE(v3) = [(HUCalendarScrubberDataSource *)v3 eventExistsOnDate:v4];

  return (char)v3;
}

- (id)indexPathForDate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [(HUCalendarScrubberDataSource *)self startDate];
  uint64_t v7 = objc_msgSend(v4, "hf_daysBetweenDates:endDate:", v6, v5);

  id v8 = (void *)MEMORY[0x1E4F28D58];

  return (id)objc_msgSend(v8, "indexPathForItem:inSection:", v7 % 7);
}

- (id)dateAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 item];

  uint64_t v7 = v6 - v5 + 8 * v5;
  id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
  v9 = [(HUCalendarScrubberDataSource *)self startDate];
  v10 = [v8 dateByAddingUnit:16 value:v7 toDate:v9 options:0];

  return v10;
}

- (BOOL)eventExistsOnDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUCalendarScrubberDataSource *)self datesWithClips];
  uint64_t v6 = objc_msgSend(v4, "hf_startOfDay");

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (unint64_t)totalNumberOfWeeks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUCalendarScrubberDataSource *)self startDate];
  if (v3
    && (id v4 = (void *)v3,
        [(HUCalendarScrubberDataSource *)self endDate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v7 = [(HUCalendarScrubberDataSource *)self startDate];
    id v8 = [(HUCalendarScrubberDataSource *)self endDate];
    uint64_t v9 = objc_msgSend(v6, "hf_daysBetweenDates:endDate:", v7, v8);

    if (v9 % 7) {
      return v9 / 7 + 1;
    }
    else {
      return v9 / 7;
    }
  }
  else
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(HUCalendarScrubberDataSource *)self dates];
      int v13 = 134217984;
      uint64_t v14 = [v12 count];
      _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "A request to layout the calendar has been made before there are any dates (count:%lu). The calendar will remain hidden.", (uint8_t *)&v13, 0xCu);
    }
    return 0;
  }
}

- (id)dayOfWeekForItemAtIndexPath:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "hf_sharedCalendar");
  uint64_t v6 = [v4 item];

  unint64_t v7 = (v6 + [v5 firstWeekday] - 1) % 7uLL;
  id v8 = [v5 veryShortStandaloneWeekdaySymbols];
  uint64_t v9 = [v8 objectAtIndexedSubscript:v7];

  return v9;
}

- (int64_t)dayOfMonthForItemAtIndexPath:(id)a3
{
  uint64_t v3 = [(HUCalendarScrubberDataSource *)self dateAtIndexPath:a3];
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
  int64_t v5 = [v4 component:16 fromDate:v3];

  return v5;
}

- (id)shortMonthNameForItemAtIndexPath:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "hf_sharedCalendar");
  unint64_t v7 = [(HUCalendarScrubberDataSource *)self dateAtIndexPath:v5];

  uint64_t v8 = [v6 component:8 fromDate:v7] - 1;
  uint64_t v9 = [v6 shortStandaloneMonthSymbols];
  v10 = [v9 objectAtIndexedSubscript:v8];
  v11 = [v10 capitalizedString];

  return v11;
}

- (void)updateDatesWithClips:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCalendarScrubberDataSource *)self datesWithClips];
  char v6 = [v5 isEqualToSet:v4];

  [(HUCalendarScrubberDataSource *)self setDatesWithClips:v4];
  if ((v6 & 1) == 0)
  {
    unint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Requesting a calendar refresh after event update.", v8, 2u);
    }

    [(HUCalendarScrubberDataSource *)self reloadDates];
  }
}

- (void)reloadDates
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUCalendarScrubberDataSource *)self datesWithClips];
  id v4 = [v3 allObjects];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_75];
  [(HUCalendarScrubberDataSource *)self setDates:v5];

  char v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [(HUCalendarScrubberDataSource *)self dates];
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Reloading dates containing clips:%@", buf, 0xCu);
  }
  uint64_t v8 = [(HUCalendarScrubberDataSource *)self dates];
  uint64_t v9 = [v8 firstObject];

  v10 = [(HUCalendarScrubberDataSource *)self dates];
  v11 = [v10 lastObject];

  [(HUCalendarScrubberDataSource *)self _updateDateBoundariesIfNeeded];
  uint64_t v12 = [(HUCalendarScrubberDataSource *)self startDate];
  int v13 = [v12 earlierDate:v9];
  int v14 = [v13 isEqualToDate:v9];

  if (v14)
  {
    uint64_t v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(HUCalendarScrubberDataSource *)self startDate];
      v17 = objc_msgSend(v9, "hf_startOfWeek");
      *(_DWORD *)buf = 138412546;
      v37 = v16;
      __int16 v38 = 2112;
      v39 = v17;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Updating calendar start date from:%@ to:%@", buf, 0x16u);
    }
    v18 = objc_msgSend(v9, "hf_startOfWeek");
    [(HUCalendarScrubberDataSource *)self setStartDate:v18];
  }
  v19 = [(HUCalendarScrubberDataSource *)self endDate];
  v20 = [v19 laterDate:v11];
  int v21 = [v20 isEqualToDate:v11];

  if (v21)
  {
    v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(HUCalendarScrubberDataSource *)self endDate];
      v24 = objc_msgSend(v11, "hf_endOfWeek");
      *(_DWORD *)buf = 138412546;
      v37 = v23;
      __int16 v38 = 2112;
      v39 = v24;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "Updating calendar end date from:%@ to:%@", buf, 0x16u);
    }
    v25 = objc_msgSend(v11, "hf_endOfWeek");
    [(HUCalendarScrubberDataSource *)self setEndDate:v25];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v26 = [(HUCalendarScrubberDataSource *)self changeObservers];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * v30++) scrubberDataSourceDidReload:self];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v28);
  }
}

uint64_t __43__HUCalendarScrubberDataSource_reloadDates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)addChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCalendarScrubberDataSource *)self changeObservers];
  [v5 addObject:v4];
}

- (void)removeChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCalendarScrubberDataSource *)self changeObservers];
  [v5 removeObject:v4];
}

- (NSSet)datesWithClips
{
  return self->_datesWithClips;
}

- (void)setDatesWithClips:(id)a3
{
}

- (NSArray)dates
{
  return self->_dates;
}

- (void)setDates:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (void)setChangeObservers:(id)a3
{
}

- (HMCameraClipManager)clipManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipManager);

  return (HMCameraClipManager *)WeakRetained;
}

- (void)setClipManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clipManager);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dates, 0);

  objc_storeStrong((id *)&self->_datesWithClips, 0);
}

@end