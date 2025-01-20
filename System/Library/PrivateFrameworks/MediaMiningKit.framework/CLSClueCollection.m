@interface CLSClueCollection
- (BOOL)hasMeaningClueWithKey:(id)a3 andValue:(id)a4;
- (BOOL)hasMeaningClueWithKey:(id)a3 value:(id)a4 andMinimumScore:(double)a5;
- (BOOL)hasOutputClueWithKey:(id)a3 andValue:(id)a4;
- (BOOL)hasOutputClueWithKey:(id)a3 value:(id)a4 andMinimumScore:(double)a5;
- (CLSClueCollection)initWithServiceManager:(id)a3;
- (CLSInputPeopleClue)mePersonClue;
- (CLSMeaningClue)locationMobilityClue;
- (double)timeInterval;
- (id)description;
- (id)inputClues;
- (id)inputCluesForKey:(id)a3;
- (id)localDates;
- (id)localEndDate;
- (id)localStartDate;
- (id)locationPlacemarks;
- (id)locationRegions;
- (id)locationRegionsInPlacemarks;
- (id)locations;
- (id)mePerson;
- (id)meaningClues;
- (id)meaningCluesForKey:(id)a3;
- (id)meaningCluesForKey:(id)a3 andValue:(id)a4;
- (id)outputClues;
- (id)outputCluesForKey:(id)a3;
- (id)outputCluesForKey:(id)a3 andValue:(id)a4;
- (id)peopleDescription;
- (id)peopleDescriptionWithoutPeople:(id)a3;
- (id)peopleNames;
- (id)uniqueInputClues;
- (id)uniqueMeaningClueForKey:(id)a3 andValue:(id)a4;
- (id)uniqueMeaningClues;
- (id)uniqueMeaningCluesForKey:(id)a3;
- (id)uniqueOutputClueForKey:(id)a3 andValue:(id)a4;
- (id)uniqueOutputClues;
- (id)uniqueOutputCluesForKey:(id)a3;
- (id)universalDateInterval;
- (id)universalDates;
- (id)universalEndDate;
- (id)universalStartDate;
- (int64_t)year;
- (unint64_t)numberOfDays;
- (unint64_t)numberOfLocations;
- (unint64_t)numberOfPersons;
- (unint64_t)numberOfTimes;
- (unint64_t)versionCount;
- (void)_incrementVersionCount;
- (void)_mergeInputClue:(id)a3;
- (void)_mergeMeaningClue:(id)a3;
- (void)_mergeOutputClue:(id)a3;
- (void)enumerateLocationClues:(id)a3;
- (void)enumeratePeopleClues:(id)a3;
- (void)enumerateTimeClues:(id)a3;
- (void)enumerateTimeOfDayClues:(id)a3;
- (void)mergeClues:(id)a3;
- (void)prepareWithProgressBlock:(id)a3;
- (void)setMePersonClue:(id)a3;
@end

@implementation CLSClueCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningCluesByKey, 0);
  objc_storeStrong((id *)&self->_outputCluesByKey, 0);
  objc_storeStrong((id *)&self->_inputCluesByKey, 0);
  objc_storeStrong((id *)&self->_mePersonClue, 0);
}

- (void)setMePersonClue:(id)a3
{
}

- (CLSInputPeopleClue)mePersonClue
{
  return self->_mePersonClue;
}

- (unint64_t)versionCount
{
  return self->_versionCount;
}

- (id)peopleDescriptionWithoutPeople:(id)a3
{
  id v4 = a3;
  v5 = [(CLSClueCollection *)self outputCluesForKey:@"People Relationship"];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"value != %@", @"Myself"];
  v7 = [v5 filteredArrayUsingPredicate:v6];

  if (v4)
  {
    v8 = (void *)MEMORY[0x1E4F28F60];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__CLSClueCollection_peopleDescriptionWithoutPeople___block_invoke;
    v15[3] = &unk_1E690FDE0;
    id v16 = v4;
    v9 = [v8 predicateWithBlock:v15];
    uint64_t v10 = [v7 filteredArrayUsingPredicate:v9];

    v7 = (void *)v10;
  }
  v11 = [v7 valueForKey:@"relatedPerson"];
  v12 = [v7 valueForKey:@"score"];
  v13 = +[CLSPersonIdentity presentationStringForPeople:v11 withScores:v12];

  return v13;
}

uint64_t __52__CLSClueCollection_peopleDescriptionWithoutPeople___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 relatedPerson];
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3] ^ 1;

  return v4;
}

- (id)peopleDescription
{
  return [(CLSClueCollection *)self peopleDescriptionWithoutPeople:0];
}

- (void)mergeClues:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    v9 = off_1E690E000;
    uint64_t v10 = off_1E690E000;
    v11 = off_1E690E000;
    v20 = self;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CLSClueCollection *)self _mergeInputClue:v13];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(CLSClueCollection *)self _mergeOutputClue:v13];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(CLSClueCollection *)self _mergeMeaningClue:v13];
            }
            else
            {
              v14 = v9;
              id v15 = v5;
              id v16 = v10;
              v17 = v11;
              v18 = +[CLSLogging sharedLogging];
              v19 = [v18 loggingConnection];

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v26 = v13;
                _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Cannot merge clue: %@", buf, 0xCu);
              }

              v11 = v17;
              uint64_t v10 = v16;
              id v5 = v15;
              v9 = v14;
              self = v20;
            }
          }
        }
        ++v12;
      }
      while (v7 != v12);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  [(CLSClueCollection *)self _incrementVersionCount];
  os_unfair_recursive_lock_unlock();
}

- (void)_mergeMeaningClue:(id)a3
{
  id v4 = a3;
  meaningCluesByKey = self->_meaningCluesByKey;
  id v14 = v4;
  uint64_t v6 = [v4 key];
  uint64_t v7 = [(NSMapTable *)meaningCluesByKey objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v14 value];
    v9 = [v7 objectForKey:v8];

    if (!v9)
    {
      v9 = objc_opt_new();
      uint64_t v10 = [v14 value];
      [v7 setObject:v9 forKey:v10];
    }
    [v9 addObject:v14];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
    uint64_t v12 = [v14 value];
    [v7 setObject:v11 forKey:v12];

    uint64_t v13 = self->_meaningCluesByKey;
    v9 = [v14 key];
    [(NSMapTable *)v13 setObject:v7 forKey:v9];
  }
}

- (void)_mergeOutputClue:(id)a3
{
  id v4 = a3;
  outputCluesByKey = self->_outputCluesByKey;
  id v14 = v4;
  uint64_t v6 = [v4 key];
  uint64_t v7 = [(NSMapTable *)outputCluesByKey objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v14 value];
    v9 = [v7 objectForKey:v8];

    if (!v9)
    {
      v9 = objc_opt_new();
      uint64_t v10 = [v14 value];
      [v7 setObject:v9 forKey:v10];
    }
    [v9 addObject:v14];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
    uint64_t v12 = [v14 value];
    [v7 setObject:v11 forKey:v12];

    uint64_t v13 = self->_outputCluesByKey;
    v9 = [v14 key];
    [(NSMapTable *)v13 setObject:v7 forKey:v9];
  }
}

- (void)_mergeInputClue:(id)a3
{
  id v4 = a3;
  inputCluesByKey = self->_inputCluesByKey;
  id v10 = v4;
  uint64_t v6 = [v4 key];
  uint64_t v7 = [(NSMapTable *)inputCluesByKey objectForKey:v6];

  if (v7)
  {
    [v7 addObject:v10];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    [v7 addObject:v10];
    uint64_t v8 = self->_inputCluesByKey;
    v9 = [v10 key];
    [(NSMapTable *)v8 setObject:v7 forKey:v9];
  }
}

- (void)prepareWithProgressBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(CLSInputClue *)self->_mePersonClue prepareIfNeeded];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(CLSClueCollection *)self inputClues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) prepareIfNeeded];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)mePerson
{
  return [(CLSInputPeopleClue *)self->_mePersonClue person];
}

- (unint64_t)numberOfPersons
{
  v2 = [(CLSClueCollection *)self inputCluesForKey:@"Global People"];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)peopleNames
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(CLSClueCollection *)self inputCluesForKey:@"Global People"];
  id v4 = [v3 valueForKeyPath:@"name"];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (void)enumeratePeopleClues:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global People"];
  id v6 = (id)[v5 copy];

  os_unfair_recursive_lock_unlock();
  [v6 enumerateObjectsUsingBlock:v4];
}

- (unint64_t)numberOfLocations
{
  v2 = [(CLSClueCollection *)self inputCluesForKey:@"Global Location"];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)locations
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(CLSClueCollection *)self inputCluesForKey:@"Global Location"];
  id v4 = [v3 valueForKeyPath:@"location"];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)locationRegionsInPlacemarks
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(CLSClueCollection *)self inputCluesForKey:@"Global Location"];
  id v4 = [v3 valueForKeyPath:@"regionInPlacemark"];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)locationRegions
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(CLSClueCollection *)self inputCluesForKey:@"Global Location"];
  id v4 = [v3 valueForKeyPath:@"region"];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)locationPlacemarks
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(CLSClueCollection *)self inputCluesForKey:@"Global Location"];
  id v4 = [v3 valueForKeyPath:@"placemark"];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (void)enumerateLocationClues:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global Location"];
  id v6 = (id)[v5 copy];

  os_unfair_recursive_lock_unlock();
  [v6 enumerateObjectsUsingBlock:v4];
}

- (unint64_t)numberOfTimes
{
  v2 = [(CLSClueCollection *)self inputCluesForKey:@"Global Time"];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)universalDateInterval
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v4 = [(CLSClueCollection *)self universalStartDate];
  uint64_t v5 = [(CLSClueCollection *)self universalEndDate];
  id v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  return v6;
}

- (id)localDates
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(CLSClueCollection *)self localStartDate];
  uint64_t v5 = [(CLSClueCollection *)self localEndDate];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)localEndDate
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global Time"];
  id v4 = (void *)[v3 copy];

  os_unfair_recursive_lock_unlock();
  uint64_t v5 = [v4 valueForKeyPath:@"localEndDate"];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  uint64_t v7 = [v6 lastObject];

  return v7;
}

- (id)localStartDate
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global Time"];
  id v4 = (void *)[v3 copy];

  os_unfair_recursive_lock_unlock();
  uint64_t v5 = [v4 valueForKeyPath:@"localStartDate"];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)universalDates
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(CLSClueCollection *)self universalStartDate];
  uint64_t v5 = [(CLSClueCollection *)self universalEndDate];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)universalEndDate
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global Time"];
  id v4 = (void *)[v3 copy];

  os_unfair_recursive_lock_unlock();
  uint64_t v5 = [v4 valueForKeyPath:@"universalEndDate"];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  uint64_t v7 = [v6 lastObject];

  return v7;
}

- (id)universalStartDate
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global Time"];
  id v4 = (void *)[v3 copy];

  os_unfair_recursive_lock_unlock();
  uint64_t v5 = [v4 valueForKeyPath:@"universalStartDate"];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (void)enumerateTimeClues:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [(NSMapTable *)self->_inputCluesByKey objectForKey:@"Global Time"];
  id v6 = (id)[v5 copy];

  os_unfair_recursive_lock_unlock();
  [v6 enumerateObjectsUsingBlock:v4];
}

- (int64_t)year
{
  v2 = [(CLSClueCollection *)self localEndDate];
  int64_t v3 = +[CLSCalendar yearFromDate:v2];

  return v3;
}

- (unint64_t)numberOfDays
{
  [(CLSClueCollection *)self timeInterval];
  return vcvtpd_u64_f64(v2 / 86400.0);
}

- (double)timeInterval
{
  int64_t v3 = [(CLSClueCollection *)self localEndDate];
  id v4 = [(CLSClueCollection *)self localStartDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (CLSMeaningClue)locationMobilityClue
{
  double v2 = [(CLSClueCollection *)self meaningCluesForKey:@"Location Mobility"];
  int64_t v3 = [v2 firstObject];

  return (CLSMeaningClue *)v3;
}

- (void)enumerateTimeOfDayClues:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSClueCollection *)self outputCluesForKey:@"Time of Day"];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (BOOL)hasMeaningClueWithKey:(id)a3 value:(id)a4 andMinimumScore:(double)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_recursive_lock_lock_with_options();
  long long v10 = [(NSMapTable *)self->_meaningCluesByKey objectForKey:v8];
  [v10 objectForKey:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "score", (void)v17);
        if (v15 >= a5)
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (BOOL)hasMeaningClueWithKey:(id)a3 andValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v8 = [(NSMapTable *)self->_meaningCluesByKey objectForKey:v7];

  id v9 = [v8 objectForKey:v6];

  LOBYTE(v6) = [v9 count] != 0;
  os_unfair_recursive_lock_unlock();

  return (char)v6;
}

- (id)uniqueMeaningClueForKey:(id)a3 andValue:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CLSMeaningClue clueWithValue:v7 forKey:v6];
  double v9 = 0.0;
  [v8 setConfidence:0.0];
  [v8 setRelevance:0.0];
  os_unfair_recursive_lock_lock_with_options();
  long long v10 = [(NSMapTable *)self->_meaningCluesByKey objectForKey:v6];
  id v11 = [v10 objectForKey:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  double v13 = 0.0;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v17 relevance];
        if (v18 >= v13) {
          double v13 = v18;
        }
        [v17 confidence];
        if (v19 >= v9) {
          double v9 = v19;
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
  if ([v11 count])
  {
    [v8 setRelevance:v13];
    objc_msgSend(v8, "setConfidence:", fmin(v9 + log10(sqrt((double)(unint64_t)objc_msgSend(v11, "count"))), 1.0));
  }
  os_unfair_recursive_lock_unlock();
  [v8 score];
  if (v20 == 0.0) {
    id v21 = 0;
  }
  else {
    id v21 = v8;
  }

  return v21;
}

- (id)meaningCluesForKey:(id)a3 andValue:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 array];
  os_unfair_recursive_lock_lock_with_options();
  long long v10 = [(NSMapTable *)self->_meaningCluesByKey objectForKey:v8];

  id v11 = [v10 objectForKey:v7];

  [v9 addObjectsFromArray:v11];
  os_unfair_recursive_lock_unlock();

  return v9;
}

- (id)uniqueMeaningCluesForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_recursive_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_meaningCluesByKey objectForKey:v4];
  id v7 = v6;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = NSAllMapTableKeys(v6);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = -[CLSClueCollection uniqueMeaningClueForKey:andValue:](self, "uniqueMeaningClueForKey:andValue:", v4, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

- (id)meaningCluesForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_recursive_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_meaningCluesByKey objectForKey:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v6, "objectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (id)uniqueMeaningClues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_recursive_lock_lock_with_options();
  meaningCluesByKey = self->_meaningCluesByKey;
  if (meaningCluesByKey)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = NSAllMapTableKeys(meaningCluesByKey);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[CLSClueCollection uniqueMeaningCluesForKey:](self, "uniqueMeaningCluesForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v3 unionSet:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)meaningClues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_recursive_lock_lock_with_options();
  meaningCluesByKey = self->_meaningCluesByKey;
  if (meaningCluesByKey)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = NSAllMapTableKeys(meaningCluesByKey);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[CLSClueCollection meaningCluesForKey:](self, "meaningCluesForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v3 addObjectsFromArray:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)hasOutputClueWithKey:(id)a3 value:(id)a4 andMinimumScore:(double)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v10 = [(NSMapTable *)self->_outputCluesByKey objectForKey:v8];
  [v10 objectForKey:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "score", (void)v17);
        if (v15 >= a5)
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (BOOL)hasOutputClueWithKey:(id)a3 andValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v8 = [(NSMapTable *)self->_outputCluesByKey objectForKey:v7];

  id v9 = [v8 objectForKey:v6];

  LOBYTE(v6) = [v9 count] != 0;
  os_unfair_recursive_lock_unlock();

  return (char)v6;
}

- (id)outputClues
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_recursive_lock_lock_with_options();
  outputCluesByKey = self->_outputCluesByKey;
  if (outputCluesByKey)
  {
    p_recursiveLock = &self->_recursiveLock;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    NSAllMapTableKeys(outputCluesByKey);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * i), p_recursiveLock);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v10 = [v9 objectEnumerator];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v3 addObjectsFromArray:*(void *)(*((void *)&v18 + 1) + 8 * j)];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)uniqueOutputClues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_recursive_lock_lock_with_options();
  outputCluesByKey = self->_outputCluesByKey;
  if (outputCluesByKey)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = NSAllMapTableKeys(outputCluesByKey);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[CLSClueCollection uniqueOutputCluesForKey:](self, "uniqueOutputCluesForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v3 unionSet:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)uniqueOutputClueForKey:(id)a3 andValue:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CLSOutputClue clueWithValue:v7 forKey:v6];
  double v9 = 0.0;
  [v8 setConfidence:0.0];
  [v8 setRelevance:0.0];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v10 = [(NSMapTable *)self->_outputCluesByKey objectForKey:v6];
  uint64_t v11 = [v10 objectForKey:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  double v13 = 0.0;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v17 relevance];
        if (v18 >= v13) {
          double v13 = v18;
        }
        [v17 confidence];
        if (v19 >= v9) {
          double v9 = v19;
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
  if ([v11 count])
  {
    [v8 setRelevance:v13];
    objc_msgSend(v8, "setConfidence:", fmin(v9 + log10(sqrt((double)(unint64_t)objc_msgSend(v11, "count"))), 1.0));
  }
  os_unfair_recursive_lock_unlock();
  [v8 score];
  if (v20 == 0.0) {
    id v21 = 0;
  }
  else {
    id v21 = v8;
  }

  return v21;
}

- (id)outputCluesForKey:(id)a3 andValue:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 array];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v10 = [(NSMapTable *)self->_outputCluesByKey objectForKey:v8];

  uint64_t v11 = [v10 objectForKey:v7];

  [v9 addObjectsFromArray:v11];
  os_unfair_recursive_lock_unlock();

  return v9;
}

- (id)uniqueOutputCluesForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_recursive_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_outputCluesByKey objectForKey:v4];
  id v7 = v6;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = NSAllMapTableKeys(v6);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = -[CLSClueCollection uniqueOutputClueForKey:andValue:](self, "uniqueOutputClueForKey:andValue:", v4, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

- (id)outputCluesForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_recursive_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_outputCluesByKey objectForKey:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v6, "objectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (id)uniqueInputClues
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_recursive_lock_lock_with_options();
  inputCluesByKey = self->_inputCluesByKey;
  if (inputCluesByKey)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = NSAllMapTableKeys(inputCluesByKey);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v11 = -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          uint64_t v12 = [v10 setWithArray:v11];
          [v3 unionSet:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)inputClues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_recursive_lock_lock_with_options();
  inputCluesByKey = self->_inputCluesByKey;
  if (inputCluesByKey)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = NSAllMapTableKeys(inputCluesByKey);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v3 addObjectsFromArray:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)inputCluesForKey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v7 = [(NSMapTable *)self->_inputCluesByKey objectForKey:v5];

  [v6 addObjectsFromArray:v7];
  os_unfair_recursive_lock_unlock();

  return v6;
}

- (void)_incrementVersionCount
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  ++obj->_versionCount;
  objc_sync_exit(obj);
}

- (id)description
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<ClueCollection>"];
  os_unfair_recursive_lock_lock_with_options();
  id v4 = objc_msgSend(@"<Input Clues>", "cls_indentBy:", 1);
  [v3 appendFormat:@"\n%@", v4];

  id v5 = NSString;
  uint64_t v6 = [(CLSClueCollection *)self localDates];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  uint64_t v9 = [v8 componentsJoinedByString:@", "];
  uint64_t v10 = [v5 stringWithFormat:@"dates:[%@]", v9];
  uint64_t v11 = objc_msgSend(v10, "cls_indentBy:", 2);
  [v3 appendFormat:@"\n%@", v11];

  long long v12 = NSString;
  long long v13 = [(CLSClueCollection *)self peopleNames];
  long long v14 = [v13 allObjects];
  long long v15 = [v14 sortedArrayUsingSelector:sel_compare_];
  long long v16 = [v15 componentsJoinedByString:@", "];
  uint64_t v17 = [v12 stringWithFormat:@"peoples:[%@]", v16];
  uint64_t v18 = objc_msgSend(v17, "cls_indentBy:", 2);
  [v3 appendFormat:@"\n%@", v18];

  v164[0] = MEMORY[0x1E4F143A8];
  v164[1] = 3221225472;
  v164[2] = __32__CLSClueCollection_description__block_invoke;
  v164[3] = &unk_1E690FD30;
  id v19 = v3;
  id v165 = v19;
  [(CLSClueCollection *)self enumerateTimeClues:v164];
  v162[0] = MEMORY[0x1E4F143A8];
  v162[1] = 3221225472;
  v162[2] = __32__CLSClueCollection_description__block_invoke_2;
  v162[3] = &unk_1E690FD58;
  id v20 = v19;
  id v163 = v20;
  [(CLSClueCollection *)self enumerateLocationClues:v162];
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __32__CLSClueCollection_description__block_invoke_3;
  v160[3] = &unk_1E690FD80;
  id v21 = v20;
  id v161 = v21;
  [(CLSClueCollection *)self enumeratePeopleClues:v160];
  long long v22 = objc_msgSend(@"<Output Clues>", "cls_indentBy:", 1);
  [v21 appendFormat:@"\n\n%@", v22];

  long long v23 = objc_opt_new();
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  v85 = self;
  obuint64_t j = [(NSMapTable *)self->_outputCluesByKey objectEnumerator];
  v100 = (char *)[obj countByEnumeratingWithState:&v156 objects:v177 count:16];
  if (v100)
  {
    id v96 = *(id *)v157;
    do
    {
      long long v24 = 0;
      do
      {
        if (*(id *)v157 != v96) {
          objc_enumerationMutation(obj);
        }
        v104 = v24;
        long long v25 = *(void **)(*((void *)&v156 + 1) + 8 * (void)v24);
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        id v108 = [v25 objectEnumerator];
        uint64_t v26 = [v108 countByEnumeratingWithState:&v152 objects:v176 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v153;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v153 != v28) {
                objc_enumerationMutation(v108);
              }
              v30 = *(void **)(*((void *)&v152 + 1) + 8 * i);
              long long v148 = 0u;
              long long v149 = 0u;
              long long v150 = 0u;
              long long v151 = 0u;
              id v31 = v30;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v148 objects:v175 count:16];
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v34 = *(void *)v149;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v149 != v34) {
                      objc_enumerationMutation(v31);
                    }
                    v36 = [*(id *)(*((void *)&v148 + 1) + 8 * j) stringValue];
                    [v23 addObject:v36];
                  }
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v148 objects:v175 count:16];
                }
                while (v33);
              }
            }
            uint64_t v27 = [v108 countByEnumeratingWithState:&v152 objects:v176 count:16];
          }
          while (v27);
        }

        long long v24 = v104 + 1;
      }
      while (v104 + 1 != v100);
      v100 = (char *)[obj countByEnumeratingWithState:&v156 objects:v177 count:16];
    }
    while (v100);
  }

  v37 = NSString;
  v38 = [v23 sortedArrayUsingSelector:sel_compare_];
  v39 = [v38 componentsJoinedByString:@", "];
  v40 = [v37 stringWithFormat:@"values:[%@]", v39];
  v41 = objc_msgSend(v40, "cls_indentBy:", 2);
  [v21 appendFormat:@"\n%@", v41];

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v87 = [(NSMapTable *)v85->_outputCluesByKey objectEnumerator];
  obja = (char *)[v87 countByEnumeratingWithState:&v144 objects:v174 count:16];
  if (obja)
  {
    id v89 = *(id *)v145;
    do
    {
      v42 = 0;
      do
      {
        if (*(id *)v145 != v89) {
          objc_enumerationMutation(v87);
        }
        v97 = v42;
        v43 = *(void **)(*((void *)&v144 + 1) + 8 * (void)v42);
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v101 = [v43 objectEnumerator];
        id v109 = (id)[v101 countByEnumeratingWithState:&v140 objects:v173 count:16];
        if (v109)
        {
          id v105 = *(id *)v141;
          do
          {
            for (k = 0; k != v109; k = (char *)k + 1)
            {
              if (*(id *)v141 != v105) {
                objc_enumerationMutation(v101);
              }
              v45 = *(void **)(*((void *)&v140 + 1) + 8 * (void)k);
              long long v136 = 0u;
              long long v137 = 0u;
              long long v138 = 0u;
              long long v139 = 0u;
              id v46 = v45;
              uint64_t v47 = [v46 countByEnumeratingWithState:&v136 objects:v172 count:16];
              if (v47)
              {
                uint64_t v48 = v47;
                uint64_t v49 = *(void *)v137;
                do
                {
                  for (uint64_t m = 0; m != v48; ++m)
                  {
                    if (*(void *)v137 != v49) {
                      objc_enumerationMutation(v46);
                    }
                    v51 = [*(id *)(*((void *)&v136 + 1) + 8 * m) description];
                    v52 = objc_msgSend(v51, "cls_indentBy:", 2);
                    [v21 appendFormat:@"\n\n%@", v52];
                  }
                  uint64_t v48 = [v46 countByEnumeratingWithState:&v136 objects:v172 count:16];
                }
                while (v48);
              }
            }
            id v109 = (id)[v101 countByEnumeratingWithState:&v140 objects:v173 count:16];
          }
          while (v109);
        }

        v42 = v97 + 1;
      }
      while (v97 + 1 != obja);
      obja = (char *)[v87 countByEnumeratingWithState:&v144 objects:v174 count:16];
    }
    while (obja);
  }

  v53 = objc_msgSend(@"<Meaning Clues>", "cls_indentBy:", 1);
  [v21 appendFormat:@"\n\n%@", v53];

  v54 = objc_opt_new();
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v90 = [(NSMapTable *)v85->_meaningCluesByKey objectEnumerator];
  v98 = (char *)[v90 countByEnumeratingWithState:&v132 objects:v171 count:16];
  if (v98)
  {
    id objb = *(id *)v133;
    do
    {
      v55 = 0;
      do
      {
        if (*(id *)v133 != objb) {
          objc_enumerationMutation(v90);
        }
        v102 = v55;
        v56 = *(void **)(*((void *)&v132 + 1) + 8 * (void)v55);
        long long v128 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v106 = [v56 objectEnumerator];
        uint64_t v57 = [v106 countByEnumeratingWithState:&v128 objects:v170 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          id v110 = *(id *)v129;
          do
          {
            for (uint64_t n = 0; n != v58; ++n)
            {
              if (*(id *)v129 != v110) {
                objc_enumerationMutation(v106);
              }
              v60 = *(void **)(*((void *)&v128 + 1) + 8 * n);
              long long v124 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              id v61 = v60;
              uint64_t v62 = [v61 countByEnumeratingWithState:&v124 objects:v169 count:16];
              if (v62)
              {
                uint64_t v63 = v62;
                uint64_t v64 = *(void *)v125;
                do
                {
                  for (iuint64_t i = 0; ii != v63; ++ii)
                  {
                    if (*(void *)v125 != v64) {
                      objc_enumerationMutation(v61);
                    }
                    v66 = [*(id *)(*((void *)&v124 + 1) + 8 * ii) stringValue];
                    [v54 addObject:v66];
                  }
                  uint64_t v63 = [v61 countByEnumeratingWithState:&v124 objects:v169 count:16];
                }
                while (v63);
              }
            }
            uint64_t v58 = [v106 countByEnumeratingWithState:&v128 objects:v170 count:16];
          }
          while (v58);
        }

        v55 = v102 + 1;
      }
      while (v102 + 1 != v98);
      v98 = (char *)[v90 countByEnumeratingWithState:&v132 objects:v171 count:16];
    }
    while (v98);
  }

  v67 = NSString;
  v68 = [v54 sortedArrayUsingSelector:sel_compare_];
  v69 = [v68 componentsJoinedByString:@", "];
  v70 = [v67 stringWithFormat:@"values:[%@]", v69];
  v71 = objc_msgSend(v70, "cls_indentBy:", 2);
  [v21 appendFormat:@"\n%@", v71];

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v86 = [(NSMapTable *)v85->_meaningCluesByKey objectEnumerator];
  v91 = (char *)[v86 countByEnumeratingWithState:&v120 objects:v168 count:16];
  if (v91)
  {
    id v88 = *(id *)v121;
    do
    {
      v72 = 0;
      do
      {
        if (*(id *)v121 != v88) {
          objc_enumerationMutation(v86);
        }
        objc = v72;
        v73 = *(void **)(*((void *)&v120 + 1) + 8 * (void)v72);
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v99 = [v73 objectEnumerator];
        v107 = (char *)[v99 countByEnumeratingWithState:&v116 objects:v167 count:16];
        if (v107)
        {
          id v103 = *(id *)v117;
          do
          {
            v74 = 0;
            do
            {
              if (*(id *)v117 != v103) {
                objc_enumerationMutation(v99);
              }
              v111 = v74;
              v75 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v74);
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              id v76 = v75;
              uint64_t v77 = [v76 countByEnumeratingWithState:&v112 objects:v166 count:16];
              if (v77)
              {
                uint64_t v78 = v77;
                uint64_t v79 = *(void *)v113;
                do
                {
                  for (juint64_t j = 0; jj != v78; ++jj)
                  {
                    if (*(void *)v113 != v79) {
                      objc_enumerationMutation(v76);
                    }
                    v81 = [*(id *)(*((void *)&v112 + 1) + 8 * jj) description];
                    v82 = objc_msgSend(v81, "cls_indentBy:", 2);
                    [v21 appendFormat:@"\n\n%@", v82];
                  }
                  uint64_t v78 = [v76 countByEnumeratingWithState:&v112 objects:v166 count:16];
                }
                while (v78);
              }

              v74 = v111 + 1;
            }
            while (v111 + 1 != v107);
            v107 = (char *)[v99 countByEnumeratingWithState:&v116 objects:v167 count:16];
          }
          while (v107);
        }

        v72 = objc + 1;
      }
      while (objc + 1 != v91);
      v91 = (char *)[v86 countByEnumeratingWithState:&v120 objects:v168 count:16];
    }
    while (v91);
  }

  os_unfair_recursive_lock_unlock();
  id v83 = v21;

  return v83;
}

void __32__CLSClueCollection_description__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = [a2 description];
  int64_t v3 = objc_msgSend(v4, "cls_indentBy:", 2);
  [v2 appendFormat:@"\n\n%@", v3];
}

void __32__CLSClueCollection_description__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = [a2 description];
  int64_t v3 = objc_msgSend(v4, "cls_indentBy:", 2);
  [v2 appendFormat:@"\n\n%@", v3];
}

void __32__CLSClueCollection_description__block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = [a2 description];
  int64_t v3 = objc_msgSend(v4, "cls_indentBy:", 2);
  [v2 appendFormat:@"\n\n%@", v3];
}

- (CLSClueCollection)initWithServiceManager:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSClueCollection;
  id v5 = [(CLSClueCollection *)&v17 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_versionCount = 1;
    v5->_recursiveLock = 0;
    uint64_t v7 = objc_opt_new();
    [v7 setRelationship:14];
    uint64_t v8 = +[CLSInputPeopleClue clueWithPeople:v7 serviceManager:v4];
    mePersonClue = v6->_mePersonClue;
    v6->_mePersonClue = (CLSInputPeopleClue *)v8;

    [(CLSClue *)v6->_mePersonClue setKey:@"__ME_PERSON__INTERNAL__"];
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    inputCluesByKey = v6->_inputCluesByKey;
    v6->_inputCluesByKey = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    outputCluesByKey = v6->_outputCluesByKey;
    v6->_outputCluesByKey = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    meaningCluesByKey = v6->_meaningCluesByKey;
    v6->_meaningCluesByKey = (NSMapTable *)v14;
  }
  return v6;
}

@end