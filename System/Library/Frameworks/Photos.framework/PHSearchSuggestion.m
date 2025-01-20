@interface PHSearchSuggestion
+ (BOOL)_suggestionsCategoryTypeIsSupportedForDisambiguation:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (PHSearchSuggestion)new;
+ (id)indexCategoriesWithApproximateCounts;
- (BOOL)hasApproximateCount;
- (BOOL)isEqual:(id)a3;
- (NSArray)momentUUIDs;
- (NSArray)personUUIDs;
- (NSArray)suggestionComponents;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (NSSet)locationAssetUUIDs;
- (NSString)text;
- (PHSearchSuggestion)init;
- (PHSearchSuggestion)initWithCoder:(id)a3;
- (PHSearchSuggestion)initWithType:(unint64_t)a3 categoriesType:(unint64_t)a4 text:(id)a5 matchRangeOfSearchText:(_NSRange)a6 count:(unint64_t)a7 suggestionComponents:(id)a8;
- (PHSearchSuggestion)initWithType:(unint64_t)a3 entityType:(unint64_t)a4 text:(id)a5 matchRangeOfSearchText:(_NSRange)a6 personUUID:(id)a7 count:(unint64_t)a8;
- (_NSRange)matchRangeOfSearchText;
- (float)score;
- (id)description;
- (id)initForDateFilterWithStartDate:(id)a3 endDate:(id)a4;
- (id)initForDateFilterWithStartDateComponents:(id)a3 endDateComponents:(id)a4;
- (id)initForGenericLocationFilterWithText:(id)a3 genericLocationTuples:(id)a4 allowedIndexCategories:(id)a5;
- (id)initForLocationFilterWithAssetUUIDs:(id)a3 locationText:(id)a4;
- (id)initForMeaningFilterWithMeaningfulEvent:(id)a3;
- (id)initForPartOfDayFilterWithPartOfDayLocalizedText:(id)a3;
- (id)initForPartOfWeekFilterWithPartOfWeekLocalizedText:(id)a3;
- (id)initForPersonFilterWithPersonUUIDs:(id)a3;
- (id)initForPersonalEventFilterWithMomentUUIDs:(id)a3;
- (id)initForTripFilterWithLocationName:(id)a3;
- (id)jsonDictionary;
- (unint64_t)categoriesType;
- (unint64_t)count;
- (unint64_t)entityType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setPersonUUIDs:(id)a3;
@end

@implementation PHSearchSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentUUIDs, 0);
  objc_storeStrong((id *)&self->_suggestionComponents, 0);
  objc_storeStrong((id *)&self->_locationAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_personUUIDs, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (NSArray)momentUUIDs
{
  return self->_momentUUIDs;
}

- (NSArray)suggestionComponents
{
  return self->_suggestionComponents;
}

- (NSSet)locationAssetUUIDs
{
  return self->_locationAssetUUIDs;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (void)setPersonUUIDs:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (_NSRange)matchRangeOfSearchText
{
  NSUInteger length = self->_matchRangeOfSearchText.length;
  NSUInteger location = self->_matchRangeOfSearchText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)categoriesType
{
  return self->_categoriesType;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (PHSearchSuggestion)initWithType:(unint64_t)a3 entityType:(unint64_t)a4 text:(id)a5 matchRangeOfSearchText:(_NSRange)a6 personUUID:(id)a7 count:(unint64_t)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v17 = a7;
  v18 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "WARNING: this PHSearchSuggestion initializer has been deprecated, and will not behave as expected in the Photos Search query pipeline.", buf, 2u);
  }

  if (a3)
  {
    if (v16) {
      goto LABEL_5;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 313, @"Invalid parameter not satisfying: %@", @"type != PHSearchSuggestionTypeUndefined" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 314, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];

LABEL_5:
  if ((a4 == 1330 || a4 == 1300) && ![v17 length])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 317, @"Invalid parameter not satisfying: %@", @"personUUID.length > 0" object file lineNumber description];
  }
  if (a3 == 1 && location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 321, @"Invalid parameter not satisfying: %@", @"matchRangeOfSearchText.location != NSNotFound" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)PHSearchSuggestion;
  v19 = [(PHSearchSuggestion *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_text, a5);
    v20->_type = a3;
    v20->_entityType = a4;
    if ([v17 length])
    {
      v30[0] = v17;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      personUUIDs = v20->_personUUIDs;
      v20->_personUUIDs = (NSArray *)v21;
    }
    else
    {
      personUUIDs = v20->_personUUIDs;
      v20->_personUUIDs = 0;
    }

    v20->_matchRangeOfSearchText.NSUInteger location = location;
    v20->_matchRangeOfSearchText.NSUInteger length = length;
    v20->_count = a8;
  }

  return v20;
}

- (id)jsonDictionary
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v26[0] = @"type";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchSuggestion type](self, "type"));
  v27[0] = v4;
  v26[1] = @"categories_type";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchSuggestion categoriesType](self, "categoriesType"));
  v27[1] = v5;
  v26[2] = @"text";
  v6 = [(PHSearchSuggestion *)self text];
  v27[2] = v6;
  v26[3] = @"match_range";
  NSUInteger location = self->_matchRangeOfSearchText.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = &stru_1EEAC1950;
  }
  else
  {
    v29.NSUInteger location = [(PHSearchSuggestion *)self matchRangeOfSearchText];
    NSStringFromRange(v29);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v10 = (void *)[v3 initWithDictionary:v9];

  if (location != 0x7FFFFFFFFFFFFFFFLL) {
  if (self->_type - 1 <= 1)
  }
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchSuggestion count](self, "count"));
    [v10 setObject:v11 forKeyedSubscript:@"count"];

    if ([(PHSearchSuggestion *)self hasApproximateCount]) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    [v10 setObject:v12 forKeyedSubscript:@"has_approximate_count"];
  }
  unint64_t categoriesType = self->_categoriesType;
  if (categoriesType == 9 || categoriesType == 7)
  {
    v14 = [(PHSearchSuggestion *)self personUUIDs];
    [v10 setObject:v14 forKeyedSubscript:@"personUUIDs"];

    unint64_t categoriesType = self->_categoriesType;
  }
  if (categoriesType == 1)
  {
    v15 = [(PHSearchSuggestion *)self locationAssetUUIDs];
    [v10 setObject:v15 forKeyedSubscript:@"location_assetUUIDs"];

    unint64_t categoriesType = self->_categoriesType;
  }
  if (categoriesType == 4)
  {
    uint64_t v16 = [(PHSearchSuggestion *)self startDate];
    if (v16
      && (id v17 = (void *)v16,
          [(PHSearchSuggestion *)self endDate],
          v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          v18))
    {
      v19 = [(PHSearchSuggestion *)self startDate];
      [v10 setObject:v19 forKeyedSubscript:@"start_date"];

      v20 = [(PHSearchSuggestion *)self endDate];
      uint64_t v21 = @"end_date";
    }
    else
    {
      v22 = [(PHSearchSuggestion *)self startDateComponents];
      [v10 setObject:v22 forKeyedSubscript:@"start_date_components"];

      v23 = [(PHSearchSuggestion *)self endDateComponents];

      if (!v23) {
        goto LABEL_23;
      }
      v20 = [(PHSearchSuggestion *)self endDateComponents];
      uint64_t v21 = @"end_date_components";
    }
    [v10 setObject:v20 forKeyedSubscript:v21];
  }
LABEL_23:
  v24 = (void *)[v10 copy];

  return v24;
}

- (id)description
{
  BOOL v3 = [(PHSearchSuggestion *)self hasApproximateCount];
  v4 = @"NO";
  if (v3) {
    v4 = @"YES";
  }
  v19 = NSString;
  v5 = v4;
  uint64_t v18 = objc_opt_class();
  unint64_t type = self->_type;
  if (type - 1 > 3) {
    v7 = @"PHSearchSuggestionTypeUndefined";
  }
  else {
    v7 = off_1E5841EA0[type - 1];
  }
  v8 = v7;
  unint64_t categoriesType = self->_categoriesType;
  if (categoriesType - 1 > 0x29) {
    v10 = @"PHSearchSuggestionCategoriesTypeUndefined";
  }
  else {
    v10 = off_1E5844490[categoriesType - 1];
  }
  v11 = v10;
  text = self->_text;
  NSUInteger location = self->_matchRangeOfSearchText.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @"NSNotFound";
  }
  else
  {
    NSStringFromRange(self->_matchRangeOfSearchText);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = [(PHSearchSuggestion *)self personUUIDs];
  objc_msgSend(v19, "stringWithFormat:", @"%@: %p, type: %ld (%@), categories type: %ld (%@) text: '%@', match range: %@, personUUIDs: %@, count: %tu, hasApproximateCount: %@, start date: %@, end date: %@, start date components: %@, end date components: %@, location asset UUIDs: %@, momentUUIDs: %@", v18, self, type, v8, categoriesType, v11, text, v14, v15, self->_count, v5, self->_startDate, self->_endDate, self->_startDateComponents, self->_endDateComponents, self->_locationAssetUUIDs,
  uint64_t v16 = self->_momentUUIDs);

  if (location != 0x7FFFFFFFFFFFFFFFLL) {

  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t type = self->_type;
  id v11 = a3;
  v6 = [v4 numberWithUnsignedInteger:type];
  [v11 encodeObject:v6 forKey:@"PHSearchSuggestionPropertyType"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_categoriesType];
  [v11 encodeObject:v7 forKey:@"PHSearchSuggestionPropertyCategoriesType"];

  [v11 encodeObject:self->_text forKey:@"PHSearchSuggestionPropertyText"];
  v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_matchRangeOfSearchText.location, self->_matchRangeOfSearchText.length);
  [v11 encodeObject:v8 forKey:@"PHSearchSuggestionPropertyMatchRangeOfSearchText"];

  [v11 encodeObject:self->_personUUIDs forKey:@"PHSearchSuggestionPropertyPersonUUIDs"];
  v9 = [NSNumber numberWithUnsignedInteger:self->_count];
  [v11 encodeObject:v9 forKey:@"PHSearchSuggestionPropertyCount"];

  [v11 encodeObject:self->_startDate forKey:@"PHSearchSuggestionPropertyStartDate"];
  [v11 encodeObject:self->_endDate forKey:@"PHSearchSuggestionPropertyEndDate"];
  [v11 encodeObject:self->_startDateComponents forKey:@"PHSearchSuggestionPropertyStartDateComponents"];
  [v11 encodeObject:self->_endDateComponents forKey:@"PHSearchSuggestionPropertyEndDateComponents"];
  v10 = [(NSSet *)self->_locationAssetUUIDs allObjects];
  [v11 encodeObject:v10 forKey:@"PHSearchSuggestionPropertyLocationAssetUUIDs"];

  [v11 encodeObject:self->_suggestionComponents forKey:@"PHSearchSuggestionPropertySuggestionComponents"];
  [v11 encodeObject:self->_momentUUIDs forKey:@"PHSearchSuggestionPropertyHighlightUUIDs"];
}

- (PHSearchSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyType"];
  uint64_t v44 = [v5 unsignedIntegerValue];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyCategoriesType"];
  uint64_t v43 = [v6 unsignedIntegerValue];

  uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyText"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyMatchRangeOfSearchText"];
  uint64_t v42 = [v7 rangeValue];
  uint64_t v9 = v8;

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v39 = [v4 decodeObjectOfClasses:v12 forKey:@"PHSearchSuggestionPropertyPersonUUIDs"];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyCount"];
  uint64_t v14 = [v13 unsignedIntegerValue];

  uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyStartDate"];
  uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyEndDate"];
  v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyStartDateComponents"];
  uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchSuggestionPropertyEndDateComponents"];
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v41 = [v4 decodeObjectOfClasses:v17 forKey:@"PHSearchSuggestionPropertyLocationAssetUUIDs"];

  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"PHSearchSuggestionPropertySuggestionComponents"];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v25 = [v4 decodeObjectOfClasses:v24 forKey:@"PHSearchSuggestionPropertyHighlightUUIDs"];

  uint64_t v26 = v9;
  uint64_t v27 = v42;
  if (v44 != 3)
  {
LABEL_19:
    v32 = (void *)v40;
    self = -[PHSearchSuggestion initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:](self, "initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:", v44, v43, v40, v27, v26, v14, v21);
    v31 = self;
    goto LABEL_20;
  }
  uint64_t v28 = v14;
  if (![(id)objc_opt_class() _suggestionsCategoryTypeIsSupportedForDisambiguation:v43])
  {
    v31 = 0;
    goto LABEL_10;
  }
  if (v43 > 6)
  {
    if (v43 != 42)
    {
      uint64_t v27 = v42;
      uint64_t v26 = v9;
      if (v43 == 7)
      {
        v33 = (void *)v39;
        self = (PHSearchSuggestion *)[(PHSearchSuggestion *)self initForPersonFilterWithPersonUUIDs:v39];
        v31 = self;
        v32 = (void *)v40;
LABEL_21:
        v30 = (void *)v45;
        NSRange v29 = (void *)v46;
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    self = (PHSearchSuggestion *)[(PHSearchSuggestion *)self initForPersonalEventFilterWithMomentUUIDs:v25];
    v31 = self;
LABEL_10:
    v32 = (void *)v40;
LABEL_20:
    v33 = (void *)v39;
    goto LABEL_21;
  }
  if (v43 != 1)
  {
    uint64_t v27 = v42;
    uint64_t v26 = v9;
    if (v43 == 4)
    {
      v30 = (void *)v45;
      NSRange v29 = (void *)v46;
      if (v46 && v45)
      {
        self = (PHSearchSuggestion *)[(PHSearchSuggestion *)self initForDateFilterWithStartDate:v46 endDate:v45];
        v31 = self;
        v33 = (void *)v39;
        v32 = (void *)v40;
LABEL_22:
        v36 = (void *)v38;
        goto LABEL_23;
      }
      uint64_t v27 = v42;
      uint64_t v26 = v9;
      uint64_t v14 = v28;
      if (v47)
      {
        v36 = (void *)v38;
        self = (PHSearchSuggestion *)[(PHSearchSuggestion *)self initForDateFilterWithStartDateComponents:v47 endDateComponents:v38];
        v31 = self;
        v33 = (void *)v39;
        v32 = (void *)v40;
        v30 = (void *)v45;
        NSRange v29 = (void *)v46;
LABEL_23:
        v34 = v41;
        goto LABEL_24;
      }
    }
    goto LABEL_19;
  }
  v34 = v41;
  if ([v41 count])
  {
    v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v41];
    self = (PHSearchSuggestion *)[(PHSearchSuggestion *)self initForLocationFilterWithAssetUUIDs:v35 locationText:0];

    v31 = self;
    v32 = (void *)v40;
  }
  else
  {
    v32 = (void *)v40;
    self = (PHSearchSuggestion *)[(PHSearchSuggestion *)self initForLocationFilterWithAssetUUIDs:0 locationText:v40];
    v31 = self;
  }
  v36 = (void *)v38;
  v33 = (void *)v39;
  v30 = (void *)v45;
  NSRange v29 = (void *)v46;
LABEL_24:

  return v31;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PHSearchSuggestion *)self type];
  NSRange v29 = [(PHSearchSuggestion *)self text];
  uint64_t v28 = [v29 localizedLowercaseString];
  uint64_t v4 = [v28 hash];
  uint64_t v27 = [(PHSearchSuggestion *)self personUUIDs];
  uint64_t v5 = v4 ^ v3 ^ [v27 hash];
  uint64_t v6 = [(PHSearchSuggestion *)self matchRangeOfSearchText];
  uint64_t v26 = [(PHSearchSuggestion *)self startDate];
  uint64_t v7 = v6 ^ [v26 hash];
  uint64_t v8 = [(PHSearchSuggestion *)self endDate];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(PHSearchSuggestion *)self startDateComponents];
  uint64_t v11 = [v10 date];
  uint64_t v12 = [v11 hash];
  v13 = [(PHSearchSuggestion *)self endDateComponents];
  uint64_t v14 = [v13 date];
  uint64_t v15 = v12 ^ [v14 hash];
  uint64_t v16 = [(PHSearchSuggestion *)self locationAssetUUIDs];
  uint64_t v17 = v9 ^ v15 ^ [v16 hash];
  unint64_t v18 = [(PHSearchSuggestion *)self count];
  unint64_t v19 = v18 ^ [(PHSearchSuggestion *)self hasApproximateCount];
  unint64_t v20 = v19 ^ [(PHSearchSuggestion *)self categoriesType];
  uint64_t v21 = [(PHSearchSuggestion *)self suggestionComponents];
  uint64_t v22 = v17 ^ v20 ^ [v21 hash];
  uint64_t v23 = [(PHSearchSuggestion *)self momentUUIDs];
  unint64_t v24 = v22 ^ [v23 hash];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PHSearchSuggestion *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(PHSearchSuggestion *)self type];
      if (v6 != [(PHSearchSuggestion *)v5 type]) {
        goto LABEL_5;
      }
      uint64_t v7 = [(PHSearchSuggestion *)self text];
      uint64_t v8 = [(PHSearchSuggestion *)v5 text];
      uint64_t v9 = [v7 localizedCaseInsensitiveCompare:v8];

      if (v9) {
        goto LABEL_5;
      }
      uint64_t v42 = [(PHSearchSuggestion *)self personUUIDs];
      if (v42
        && ([(PHSearchSuggestion *)v5 personUUIDs], (uint64_t v43 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v44 = (void *)v43;
        uint64_t v45 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v46 = [(PHSearchSuggestion *)self personUUIDs];
        v47 = [v45 setWithArray:v46];
        v48 = (void *)MEMORY[0x1E4F1CAD0];
        v49 = [(PHSearchSuggestion *)v5 personUUIDs];
        v50 = [v48 setWithArray:v49];
        char v51 = [v47 isEqualToSet:v50];

        if ((v51 & 1) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
        v56 = [(PHSearchSuggestion *)self personUUIDs];
        v57 = [(PHSearchSuggestion *)v5 personUUIDs];

        if (v42) {
        if (v56 != v57)
        }
          goto LABEL_5;
      }
      unint64_t v58 = [(PHSearchSuggestion *)self count];
      if (v58 == [(PHSearchSuggestion *)v5 count])
      {
        BOOL v59 = [(PHSearchSuggestion *)self hasApproximateCount];
        if (v59 == [(PHSearchSuggestion *)v5 hasApproximateCount])
        {
          v60 = [(PHSearchSuggestion *)self startDate];
          if (!v60
            || ([(PHSearchSuggestion *)v5 startDate], (uint64_t v61 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v84 = [(PHSearchSuggestion *)self startDate];
            v85 = [(PHSearchSuggestion *)v5 startDate];

            if (v60) {
            if (v84 != v85)
            }
              goto LABEL_5;
LABEL_74:
            v86 = [(PHSearchSuggestion *)self endDate];
            if (v86 && ([(PHSearchSuggestion *)v5 endDate], (uint64_t v87 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v88 = (void *)v87;
              v89 = [(PHSearchSuggestion *)self endDate];
              v90 = [(PHSearchSuggestion *)v5 endDate];
              int v10 = [v89 isEqualToDate:v90];
            }
            else
            {
              v88 = [(PHSearchSuggestion *)self endDate];
              v89 = [(PHSearchSuggestion *)v5 endDate];
              int v10 = v88 == v89;
            }

            goto LABEL_6;
          }
          v62 = (void *)v61;
          v63 = [(PHSearchSuggestion *)self startDate];
          v64 = [(PHSearchSuggestion *)v5 startDate];
          char v65 = [v63 isEqualToDate:v64];

          if (v65) {
            goto LABEL_74;
          }
        }
      }
LABEL_5:
      int v10 = 0;
LABEL_6:
      uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v12 = [(PHSearchSuggestion *)self startDateComponents];
      if (v12)
      {
        v13 = [(PHSearchSuggestion *)self startDateComponents];
        uint64_t v14 = [v11 dateFromComponents:v13];
      }
      else
      {
        uint64_t v14 = 0;
      }

      uint64_t v16 = [(PHSearchSuggestion *)v5 startDateComponents];
      if (v16)
      {
        uint64_t v17 = [(PHSearchSuggestion *)v5 startDateComponents];
        unint64_t v18 = [v11 dateFromComponents:v17];
      }
      else
      {
        unint64_t v18 = 0;
      }

      if (v10)
      {
        unint64_t v19 = [(PHSearchSuggestion *)self startDateComponents];
        if (v19
          && ([(PHSearchSuggestion *)v5 startDateComponents],
              (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v21 = (void *)v20;
          int v22 = [v14 isEqualToDate:v18];
        }
        else
        {
          uint64_t v21 = [(PHSearchSuggestion *)self startDateComponents];
          uint64_t v23 = [(PHSearchSuggestion *)v5 startDateComponents];
          int v22 = v21 == v23;
        }
      }
      else
      {
        int v22 = 0;
      }
      unint64_t v24 = [(PHSearchSuggestion *)self endDateComponents];
      v98 = v14;
      if (v24)
      {
        v25 = [(PHSearchSuggestion *)self endDateComponents];
        uint64_t v26 = [v11 dateFromComponents:v25];
      }
      else
      {
        uint64_t v26 = 0;
      }

      uint64_t v27 = [(PHSearchSuggestion *)v5 endDateComponents];
      if (v27)
      {
        uint64_t v28 = [(PHSearchSuggestion *)v5 endDateComponents];
        NSRange v29 = [v11 dateFromComponents:v28];
      }
      else
      {
        NSRange v29 = 0;
      }

      if (!v22) {
        goto LABEL_46;
      }
      v30 = [(PHSearchSuggestion *)self endDateComponents];
      if (v30
        && ([(PHSearchSuggestion *)v5 endDateComponents],
            (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v32 = (void *)v31;
        char v33 = [v26 isEqualToDate:v29];

        if ((v33 & 1) == 0) {
          goto LABEL_46;
        }
      }
      else
      {
        v34 = [(PHSearchSuggestion *)self endDateComponents];
        v35 = [(PHSearchSuggestion *)v5 endDateComponents];

        if (v30) {
        if (v34 != v35)
        }
          goto LABEL_46;
      }
      v36 = [(PHSearchSuggestion *)self locationAssetUUIDs];
      if (v36
        && ([(PHSearchSuggestion *)v5 locationAssetUUIDs],
            (uint64_t v37 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v38 = (void *)v37;
        uint64_t v39 = [(PHSearchSuggestion *)self locationAssetUUIDs];
        [(PHSearchSuggestion *)v5 locationAssetUUIDs];
        v95 = v26;
        v41 = uint64_t v40 = v18;
        char v92 = [v39 isEqualToSet:v41];

        unint64_t v18 = v40;
        uint64_t v26 = v95;

        if ((v92 & 1) == 0) {
          goto LABEL_46;
        }
      }
      else
      {
        v52 = [(PHSearchSuggestion *)self locationAssetUUIDs];
        v53 = [(PHSearchSuggestion *)v5 locationAssetUUIDs];

        if (v36) {
        if (v52 != v53)
        }
          goto LABEL_46;
      }
      unint64_t v66 = [(PHSearchSuggestion *)self categoriesType];
      BOOL v67 = v66 == [(PHSearchSuggestion *)v5 categoriesType];
      v54 = v98;
      if (!v67)
      {
        char v15 = 0;
        goto LABEL_48;
      }
      v68 = [(PHSearchSuggestion *)self suggestionComponents];
      if (!v68
        || ([(PHSearchSuggestion *)v5 suggestionComponents],
            (uint64_t v69 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v74 = [(PHSearchSuggestion *)self suggestionComponents];
        v75 = [(PHSearchSuggestion *)v5 suggestionComponents];

        if (v68) {
        if (v74 != v75)
        }
          goto LABEL_46;
LABEL_68:
        v76 = [(PHSearchSuggestion *)self momentUUIDs];
        if (v76
          && ([(PHSearchSuggestion *)v5 momentUUIDs], (uint64_t v77 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v78 = (void *)v77;
          v94 = v76;
          v97 = v18;
          v79 = (void *)MEMORY[0x1E4F1CAD0];
          v80 = [(PHSearchSuggestion *)self momentUUIDs];
          v91 = [v79 setWithArray:v80];
          v81 = (void *)MEMORY[0x1E4F1CAD0];
          v82 = [(PHSearchSuggestion *)v5 momentUUIDs];
          v83 = [v81 setWithArray:v82];
          char v15 = [v91 isEqualToSet:v83];

          v76 = v94;
          unint64_t v18 = v97;
        }
        else
        {
          v78 = [(PHSearchSuggestion *)self momentUUIDs];
          v80 = [(PHSearchSuggestion *)v5 momentUUIDs];
          char v15 = v78 == v80;
        }

        goto LABEL_47;
      }
      v70 = (void *)v69;
      v71 = [(PHSearchSuggestion *)self suggestionComponents];
      [(PHSearchSuggestion *)v5 suggestionComponents];
      v96 = v26;
      v73 = v72 = v18;
      char v93 = [v71 isEqualToArray:v73];

      unint64_t v18 = v72;
      uint64_t v26 = v96;

      if (v93) {
        goto LABEL_68;
      }
LABEL_46:
      char v15 = 0;
LABEL_47:
      v54 = v98;
LABEL_48:

      goto LABEL_49;
    }
    char v15 = 0;
  }
LABEL_49:

  return v15;
}

- (NSArray)personUUIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  personUUIDs = self->_personUUIDs;
  if (!personUUIDs)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(PHSearchSuggestion *)self suggestionComponents];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 indexCategory] == 1300
            || [v10 indexCategory] == 1301
            || [v10 indexCategory] == 1330
            || [v10 indexCategory] == 1331)
          {
            uint64_t v11 = [v10 lookupIdentifier];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v12 = (NSArray *)[v4 copy];
    v13 = self->_personUUIDs;
    self->_personUUIDs = v12;

    personUUIDs = self->_personUUIDs;
  }

  return personUUIDs;
}

- (float)score
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PHSearchSuggestion *)self suggestionComponents];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(PHSearchSuggestion *)self suggestionComponents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    float v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) score];
        float v9 = v9 + v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    float v9 = 0.0;
  }

  v13 = [(PHSearchSuggestion *)self suggestionComponents];
  float v12 = v9 / (float)(unint64_t)[v13 count];

  return v12;
}

- (BOOL)hasApproximateCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    unint64_t v3 = [(id)objc_opt_class() indexCategoriesWithApproximateCounts];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(PHSearchSuggestion *)self suggestionComponents];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(v3, "containsIndex:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "indexCategory")))
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (PHSearchSuggestion)initWithType:(unint64_t)a3 categoriesType:(unint64_t)a4 text:(id)a5 matchRangeOfSearchText:(_NSRange)a6 count:(unint64_t)a7 suggestionComponents:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a5;
  id v16 = a8;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    unint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 37, @"Invalid parameter not satisfying: %@", @"categoriesType != PHSearchSuggestionCategoriesTypeUndefined" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 36, @"Invalid parameter not satisfying: %@", @"type != PHSearchSuggestionTypeUndefined" object file lineNumber description];

  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_15:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 38, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];

LABEL_4:
  if (a3 - 1 <= 1)
  {
    if (![v16 count])
    {
      uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 41, @"Invalid parameter not satisfying: %@", @"suggestionComponents.count > 0" object file lineNumber description];
    }
    if (a3 == 1 && location == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 45, @"Invalid parameter not satisfying: %@", @"matchRangeOfSearchText.location != NSNotFound" object file lineNumber description];
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)PHSearchSuggestion;
  long long v17 = [(PHSearchSuggestion *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    text = v17->_text;
    v17->_text = (NSString *)v18;

    v17->_unint64_t type = a3;
    v17->_unint64_t categoriesType = a4;
    v17->_matchRangeOfSearchText.NSUInteger location = location;
    v17->_matchRangeOfSearchText.NSUInteger length = length;
    v17->_count = a7;
    uint64_t v20 = [v16 copy];
    suggestionComponents = v17->_suggestionComponents;
    v17->_suggestionComponents = (NSArray *)v20;
  }
  return v17;
}

- (PHSearchSuggestion)init
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)_suggestionsCategoryTypeIsSupportedForDisambiguation:(unint64_t)a3
{
  return (a3 < 8) & (0x92u >> a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)indexCategoriesWithApproximateCounts
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:1500];
  [v2 addIndex:1501];
  [v2 addIndex:2600];
  [v2 addIndex:2601];
  [v2 addIndex:2500];
  [v2 addIndex:2501];
  [v2 addIndex:1104];
  [v2 addIndex:1510];
  [v2 addIndex:1520];
  [v2 addIndex:1530];
  [v2 addIndex:1540];
  id v3 = (void *)[v2 copy];

  return v3;
}

+ (PHSearchSuggestion)new
{
  id v2 = a1;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)initForPersonalEventFilterWithMomentUUIDs:(id)a3
{
  id v6 = a3;
  if (![v6 count])
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 570, @"Invalid parameter not satisfying: %@", @"momentUUIDs.count > 0" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PHSearchSuggestion;
  uint64_t v7 = [(PHSearchSuggestion *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    text = v7->_text;
    v7->_text = (NSString *)&stru_1EEAC1950;

    *(_OWORD *)&v8->_unint64_t type = xmmword_19B2CC640;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    objc_storeStrong((id *)&v8->_momentUUIDs, a3);
  }

  return v8;
}

- (id)initForMeaningFilterWithMeaningfulEvent:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 length])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 548, @"Invalid parameter not satisfying: %@", @"meaningfulEvent.length > 0" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PHSearchSuggestion;
  uint64_t v7 = [(PHSearchSuggestion *)&v15 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_text, a3);
    *(_OWORD *)&v8->_unint64_t type = xmmword_19B2CC650;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8ABC8]), "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v6, 0, 0, 0, 0, 1600, 0.0, 0, 3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    long long v10 = (void *)v9;
    if (v9)
    {
      v16[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      suggestionComponents = v8->_suggestionComponents;
      v8->_suggestionComponents = (NSArray *)v11;
    }
  }

  return v8;
}

- (id)initForTripFilterWithLocationName:(id)a3
{
  id v6 = a3;
  if (![v6 length])
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 532, @"Invalid parameter not satisfying: %@", @"locationName.length > 0" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PHSearchSuggestion;
  uint64_t v7 = [(PHSearchSuggestion *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_text, a3);
    *(_OWORD *)&v8->_unint64_t type = xmmword_19B2CC660;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
  }

  return v8;
}

- (id)initForGenericLocationFilterWithText:(id)a3 genericLocationTuples:(id)a4 allowedIndexCategories:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PHSearchSuggestion;
  objc_super v12 = [(PHSearchSuggestion *)&v36 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    *(_OWORD *)&v13->_unint64_t type = xmmword_19B2CC650;
    v30 = v13;
    v13->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v10;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (!v16) {
      goto LABEL_27;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v21 = [v20 indexCategory];
        if (![v11 count] || objc_msgSend(v11, "containsIndex:", v21))
        {
          if (v21 > 1599)
          {
            BOOL v26 = (unint64_t)(v21 - 1800) > 3 || v21 == 1801;
            if (!v26 || (unint64_t)(v21 - 1600) < 2 || (unint64_t)(v21 - 1700) < 2)
            {
              v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8ABC8]), "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v9, 0, 0, 0, 0, v21, 0.0, 0, 3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
              if (v25)
              {
LABEL_24:
                [v14 addObject:v25];

                continue;
              }
            }
          }
          else if ((unint64_t)(v21 - 1500) <= 0x1F && ((1 << (v21 + 36)) & 0xC0300C03) != 0)
          {
            id v23 = objc_alloc(MEMORY[0x1E4F8ABC8]);
            unint64_t v24 = [v20 lookupIdentifier];
            v25 = objc_msgSend(v23, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v9, 0, 0, 0, 0, v21, 0.0, v24, 3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);

            if (v25) {
              goto LABEL_24;
            }
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (!v17)
      {
LABEL_27:

        uint64_t v27 = [v14 copy];
        v13 = v30;
        suggestionComponents = v30->_suggestionComponents;
        v30->_suggestionComponents = (NSArray *)v27;

        id v10 = v31;
        break;
      }
    }
  }

  return v13;
}

- (id)initForPartOfWeekFilterWithPartOfWeekLocalizedText:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 445, @"Invalid parameter not satisfying: %@", @"partOfWeekLocalizedText" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PHSearchSuggestion;
  uint64_t v7 = [(PHSearchSuggestion *)&v15 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_text, a3);
    *(_OWORD *)&v8->_unint64_t type = xmmword_19B2CC670;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8ABC8]), "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v6, 0, 0, 0, 0, 1107, 0.0, 0, 3, 0, v8->_matchRangeOfSearchText.location, v8->_matchRangeOfSearchText.length);
    id v10 = (void *)v9;
    if (v9)
    {
      v16[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      suggestionComponents = v8->_suggestionComponents;
      v8->_suggestionComponents = (NSArray *)v11;
    }
  }

  return v8;
}

- (id)initForPartOfDayFilterWithPartOfDayLocalizedText:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 417, @"Invalid parameter not satisfying: %@", @"partOfDayLocalizedText" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PHSearchSuggestion;
  uint64_t v7 = [(PHSearchSuggestion *)&v15 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_text, a3);
    *(_OWORD *)&v8->_unint64_t type = xmmword_19B2CC670;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8ABC8]), "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v6, 0, 0, 0, 0, 1106, 0.0, 0, 3, 0, v8->_matchRangeOfSearchText.location, v8->_matchRangeOfSearchText.length);
    id v10 = (void *)v9;
    if (v9)
    {
      v16[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      suggestionComponents = v8->_suggestionComponents;
      v8->_suggestionComponents = (NSArray *)v11;
    }
  }

  return v8;
}

- (id)initForDateFilterWithStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 400, @"Invalid parameter not satisfying: %@", @"startDateComponents" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PHSearchSuggestion;
  id v10 = [(PHSearchSuggestion *)&v15 init];
  uint64_t v11 = v10;
  if (v10)
  {
    text = v10->_text;
    v10->_text = (NSString *)&stru_1EEAC1950;

    *(_OWORD *)&v11->_unint64_t type = xmmword_19B2CC670;
    v11->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    objc_storeStrong((id *)&v11->_startDateComponents, a3);
    objc_storeStrong((id *)&v11->_endDateComponents, a4);
  }

  return v11;
}

- (id)initForDateFilterWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 382, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 383, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PHSearchSuggestion;
  uint64_t v11 = [(PHSearchSuggestion *)&v17 init];
  objc_super v12 = v11;
  if (v11)
  {
    text = v11->_text;
    v11->_text = (NSString *)&stru_1EEAC1950;

    *(_OWORD *)&v12->_unint64_t type = xmmword_19B2CC670;
    v12->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
  }

  return v12;
}

- (id)initForPersonFilterWithPersonUUIDs:(id)a3
{
  id v6 = a3;
  if (![v6 count])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 366, @"Invalid parameter not satisfying: %@", @"personUUIDs.count > 0" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PHSearchSuggestion;
  uint64_t v7 = [(PHSearchSuggestion *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    text = v7->_text;
    v7->_text = (NSString *)&stru_1EEAC1950;

    *(_OWORD *)&v8->_unint64_t type = xmmword_19B2CC680;
    objc_storeStrong((id *)&v8->_personUUIDs, a3);
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
  }

  return v8;
}

- (id)initForLocationFilterWithAssetUUIDs:(id)a3 locationText:(id)a4
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  if (![v8 count] && !-[__CFString length](v9, "length"))
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHSearchSuggestion.m", 346, @"Invalid parameter not satisfying: %@", @"assetUUIDs.count > 0 || locationText.length > 0" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PHSearchSuggestion;
  id v10 = [(PHSearchSuggestion *)&v16 init];
  if (v10)
  {
    if ([v8 count])
    {
      text = v10->_text;
      v10->_text = (NSString *)&stru_1EEAC1950;
    }
    else
    {
      objc_super v12 = &stru_1EEAC1950;
      if (v9) {
        objc_super v12 = v9;
      }
      v13 = v12;
      text = v10->_text;
      v10->_text = &v13->isa;
    }

    objc_storeStrong((id *)&v10->_locationAssetUUIDs, a3);
    *(_OWORD *)&v10->_unint64_t type = xmmword_19B2CC690;
    v10->_matchRangeOfSearchText = (_NSRange)xmmword_19B2CC5E0;
  }

  return v10;
}

@end