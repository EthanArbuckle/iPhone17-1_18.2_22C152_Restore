@interface IRStatisticsDO
+ (BOOL)supportsSecureCoding;
+ (IRStatisticsDO)statisticsDOWithNumberOfContextChanges:(int64_t)a3 numberOfMiLoPredictions:(int64_t)a4 numberOfMiLoPredictionsInUpdatesMode:(int64_t)a5 lastMiLoLSLItems:(int64_t)a6 lastMiLoQualityReasonBitmap:(int64_t)a7 lastMiLoQuality:(int64_t)a8 lastMiLoModels:(int64_t)a9 timeInUpdatesModeInSeconds:(int64_t)a10 numberOfPickerChoiceEvents:(int64_t)a11 numberOfCorrectPickerChoiceEvents:(int64_t)a12 lastClearDate:(id)a13;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStatisticsDO:(id)a3;
- (IRStatisticsDO)initWithCoder:(id)a3;
- (IRStatisticsDO)initWithNumberOfContextChanges:(int64_t)a3 numberOfMiLoPredictions:(int64_t)a4 numberOfMiLoPredictionsInUpdatesMode:(int64_t)a5 lastMiLoLSLItems:(int64_t)a6 lastMiLoQualityReasonBitmap:(int64_t)a7 lastMiLoQuality:(int64_t)a8 lastMiLoModels:(int64_t)a9 timeInUpdatesModeInSeconds:(int64_t)a10 numberOfPickerChoiceEvents:(int64_t)a11 numberOfCorrectPickerChoiceEvents:(int64_t)a12 lastClearDate:(id)a13;
- (NSDate)lastClearDate;
- (id)copyWithReplacementLastClearDate:(id)a3;
- (id)copyWithReplacementLastMiLoLSLItems:(int64_t)a3;
- (id)copyWithReplacementLastMiLoModels:(int64_t)a3;
- (id)copyWithReplacementLastMiLoQuality:(int64_t)a3;
- (id)copyWithReplacementLastMiLoQualityReasonBitmap:(int64_t)a3;
- (id)copyWithReplacementNumberOfContextChanges:(int64_t)a3;
- (id)copyWithReplacementNumberOfCorrectPickerChoiceEvents:(int64_t)a3;
- (id)copyWithReplacementNumberOfMiLoPredictions:(int64_t)a3;
- (id)copyWithReplacementNumberOfMiLoPredictionsInUpdatesMode:(int64_t)a3;
- (id)copyWithReplacementNumberOfPickerChoiceEvents:(int64_t)a3;
- (id)copyWithReplacementTimeInUpdatesModeInSeconds:(int64_t)a3;
- (id)description;
- (int64_t)lastMiLoLSLItems;
- (int64_t)lastMiLoModels;
- (int64_t)lastMiLoQuality;
- (int64_t)lastMiLoQualityReasonBitmap;
- (int64_t)numberOfContextChanges;
- (int64_t)numberOfCorrectPickerChoiceEvents;
- (int64_t)numberOfMiLoPredictions;
- (int64_t)numberOfMiLoPredictionsInUpdatesMode;
- (int64_t)numberOfPickerChoiceEvents;
- (int64_t)timeInUpdatesModeInSeconds;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRStatisticsDO

- (NSDate)lastClearDate
{
  return self->_lastClearDate;
}

- (int64_t)numberOfContextChanges
{
  return self->_numberOfContextChanges;
}

- (int64_t)timeInUpdatesModeInSeconds
{
  return self->_timeInUpdatesModeInSeconds;
}

- (int64_t)numberOfPickerChoiceEvents
{
  return self->_numberOfPickerChoiceEvents;
}

- (int64_t)numberOfMiLoPredictions
{
  return self->_numberOfMiLoPredictions;
}

- (int64_t)numberOfMiLoPredictionsInUpdatesMode
{
  return self->_numberOfMiLoPredictionsInUpdatesMode;
}

- (int64_t)numberOfCorrectPickerChoiceEvents
{
  return self->_numberOfCorrectPickerChoiceEvents;
}

- (int64_t)lastMiLoQuality
{
  return self->_lastMiLoQuality;
}

- (int64_t)lastMiLoQualityReasonBitmap
{
  return self->_lastMiLoQualityReasonBitmap;
}

- (int64_t)lastMiLoModels
{
  return self->_lastMiLoModels;
}

- (int64_t)lastMiLoLSLItems
{
  return self->_lastMiLoLSLItems;
}

- (void).cxx_destruct
{
}

- (id)copyWithReplacementNumberOfContextChanges:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:a3 numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (IRStatisticsDO)initWithNumberOfContextChanges:(int64_t)a3 numberOfMiLoPredictions:(int64_t)a4 numberOfMiLoPredictionsInUpdatesMode:(int64_t)a5 lastMiLoLSLItems:(int64_t)a6 lastMiLoQualityReasonBitmap:(int64_t)a7 lastMiLoQuality:(int64_t)a8 lastMiLoModels:(int64_t)a9 timeInUpdatesModeInSeconds:(int64_t)a10 numberOfPickerChoiceEvents:(int64_t)a11 numberOfCorrectPickerChoiceEvents:(int64_t)a12 lastClearDate:(id)a13
{
  id v20 = a13;
  v24.receiver = self;
  v24.super_class = (Class)IRStatisticsDO;
  v21 = [(IRStatisticsDO *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_numberOfContextChanges = a3;
    v21->_numberOfMiLoPredictions = a4;
    v21->_numberOfMiLoPredictionsInUpdatesMode = a5;
    v21->_lastMiLoLSLItems = a6;
    v21->_lastMiLoQualityReasonBitmap = a7;
    v21->_lastMiLoQuality = a8;
    v21->_lastMiLoModels = a9;
    v21->_timeInUpdatesModeInSeconds = a10;
    v21->_numberOfPickerChoiceEvents = a11;
    v21->_numberOfCorrectPickerChoiceEvents = a12;
    objc_storeStrong((id *)&v21->_lastClearDate, a13);
  }

  return v22;
}

+ (IRStatisticsDO)statisticsDOWithNumberOfContextChanges:(int64_t)a3 numberOfMiLoPredictions:(int64_t)a4 numberOfMiLoPredictionsInUpdatesMode:(int64_t)a5 lastMiLoLSLItems:(int64_t)a6 lastMiLoQualityReasonBitmap:(int64_t)a7 lastMiLoQuality:(int64_t)a8 lastMiLoModels:(int64_t)a9 timeInUpdatesModeInSeconds:(int64_t)a10 numberOfPickerChoiceEvents:(int64_t)a11 numberOfCorrectPickerChoiceEvents:(int64_t)a12 lastClearDate:(id)a13
{
  id v20 = a13;
  v21 = (void *)[objc_alloc((Class)a1) initWithNumberOfContextChanges:a3 numberOfMiLoPredictions:a4 numberOfMiLoPredictionsInUpdatesMode:a5 lastMiLoLSLItems:a6 lastMiLoQualityReasonBitmap:a7 lastMiLoQuality:a8 lastMiLoModels:a9 timeInUpdatesModeInSeconds:a10 numberOfPickerChoiceEvents:a11 numberOfCorrectPickerChoiceEvents:a12 lastClearDate:v20];

  return (IRStatisticsDO *)v21;
}

- (id)copyWithReplacementNumberOfMiLoPredictions:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:a3 numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementNumberOfMiLoPredictionsInUpdatesMode:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:a3 lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementLastMiLoLSLItems:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:a3 lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementLastMiLoQualityReasonBitmap:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:a3 lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementLastMiLoQuality:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:a3 lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementLastMiLoModels:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:a3 timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementTimeInUpdatesModeInSeconds:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:a3 numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementNumberOfPickerChoiceEvents:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:a3 numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementNumberOfCorrectPickerChoiceEvents:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:a3 lastClearDate:self->_lastClearDate];
}

- (id)copyWithReplacementLastClearDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNumberOfContextChanges:self->_numberOfContextChanges numberOfMiLoPredictions:self->_numberOfMiLoPredictions numberOfMiLoPredictionsInUpdatesMode:self->_numberOfMiLoPredictionsInUpdatesMode lastMiLoLSLItems:self->_lastMiLoLSLItems lastMiLoQualityReasonBitmap:self->_lastMiLoQualityReasonBitmap lastMiLoQuality:self->_lastMiLoQuality lastMiLoModels:self->_lastMiLoModels timeInUpdatesModeInSeconds:self->_timeInUpdatesModeInSeconds numberOfPickerChoiceEvents:self->_numberOfPickerChoiceEvents numberOfCorrectPickerChoiceEvents:self->_numberOfCorrectPickerChoiceEvents lastClearDate:v4];

  return v5;
}

- (BOOL)isEqualToStatisticsDO:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  int64_t numberOfContextChanges = self->_numberOfContextChanges;
  if (numberOfContextChanges != [v4 numberOfContextChanges]) {
    goto LABEL_15;
  }
  int64_t numberOfMiLoPredictions = self->_numberOfMiLoPredictions;
  if (numberOfMiLoPredictions != [v5 numberOfMiLoPredictions]) {
    goto LABEL_15;
  }
  int64_t numberOfMiLoPredictionsInUpdatesMode = self->_numberOfMiLoPredictionsInUpdatesMode;
  if (numberOfMiLoPredictionsInUpdatesMode != [v5 numberOfMiLoPredictionsInUpdatesMode]) {
    goto LABEL_15;
  }
  int64_t lastMiLoLSLItems = self->_lastMiLoLSLItems;
  if (lastMiLoLSLItems != [v5 lastMiLoLSLItems]) {
    goto LABEL_15;
  }
  int64_t lastMiLoQualityReasonBitmap = self->_lastMiLoQualityReasonBitmap;
  if (lastMiLoQualityReasonBitmap != [v5 lastMiLoQualityReasonBitmap]) {
    goto LABEL_15;
  }
  int64_t lastMiLoQuality = self->_lastMiLoQuality;
  if (lastMiLoQuality != [v5 lastMiLoQuality]) {
    goto LABEL_15;
  }
  int64_t lastMiLoModels = self->_lastMiLoModels;
  if (lastMiLoModels != [v5 lastMiLoModels]) {
    goto LABEL_15;
  }
  int64_t timeInUpdatesModeInSeconds = self->_timeInUpdatesModeInSeconds;
  if (timeInUpdatesModeInSeconds != [v5 timeInUpdatesModeInSeconds]) {
    goto LABEL_15;
  }
  int64_t numberOfPickerChoiceEvents = self->_numberOfPickerChoiceEvents;
  if (numberOfPickerChoiceEvents == [v5 numberOfPickerChoiceEvents]
    && (int64_t numberOfCorrectPickerChoiceEvents = self->_numberOfCorrectPickerChoiceEvents,
        numberOfCorrectPickerChoiceEvents == [v5 numberOfCorrectPickerChoiceEvents])
    && (int v16 = self->_lastClearDate != 0,
        [v5 lastClearDate],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = v17 == 0,
        v17,
        v16 != v18))
  {
    lastClearDate = self->_lastClearDate;
    if (lastClearDate)
    {
      id v20 = [v5 lastClearDate];
      char v21 = [(NSDate *)lastClearDate isEqual:v20];
    }
    else
    {
      char v21 = 1;
    }
  }
  else
  {
LABEL_15:
    char v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRStatisticsDO *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRStatisticsDO *)self isEqualToStatisticsDO:v5];

  return v6;
}

- (unint64_t)hash
{
  int64_t v2 = self->_numberOfMiLoPredictions - self->_numberOfContextChanges + 32 * self->_numberOfContextChanges;
  int64_t v3 = self->_numberOfMiLoPredictionsInUpdatesMode - v2 + 32 * v2;
  int64_t v4 = self->_lastMiLoLSLItems - v3 + 32 * v3;
  int64_t v5 = self->_lastMiLoQualityReasonBitmap - v4 + 32 * v4;
  int64_t v6 = self->_lastMiLoQuality - v5 + 32 * v5;
  int64_t v7 = self->_lastMiLoModels - v6 + 32 * v6;
  int64_t v8 = self->_timeInUpdatesModeInSeconds - v7 + 32 * v7;
  int64_t v9 = self->_numberOfPickerChoiceEvents - v8 + 32 * v8;
  int64_t v10 = self->_numberOfCorrectPickerChoiceEvents - v9 + 32 * v9;
  return [(NSDate *)self->_lastClearDate hash] - v10 + 32 * v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRStatisticsDO)initWithCoder:(id)a3
{
  v60[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"numberOfContextChanges"];
  if (!v5)
  {
    id v20 = [v4 error];

    if (v20) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"numberOfContextChanges"] & 1) == 0)
    {
      uint64_t v59 = *MEMORY[0x263F08320];
      v60[0] = @"Missing serialized value for IRStatisticsDO.numberOfContextChanges";
      char v21 = NSDictionary;
      v22 = (__CFString **)v60;
      v23 = &v59;
      goto LABEL_47;
    }
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"numberOfMiLoPredictions"];
  if (!v6)
  {
    objc_super v24 = [v4 error];

    if (v24) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"numberOfMiLoPredictions"] & 1) == 0)
    {
      uint64_t v57 = *MEMORY[0x263F08320];
      v58 = @"Missing serialized value for IRStatisticsDO.numberOfMiLoPredictions";
      char v21 = NSDictionary;
      v22 = &v58;
      v23 = &v57;
      goto LABEL_47;
    }
  }
  uint64_t v7 = [v4 decodeInt64ForKey:@"numberOfMiLoPredictionsInUpdatesMode"];
  if (!v7)
  {
    v25 = [v4 error];

    if (v25) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"numberOfMiLoPredictionsInUpdatesMode"] & 1) == 0)
    {
      uint64_t v55 = *MEMORY[0x263F08320];
      v56 = @"Missing serialized value for IRStatisticsDO.numberOfMiLoPredictionsInUpdatesMode";
      char v21 = NSDictionary;
      v22 = &v56;
      v23 = &v55;
      goto LABEL_47;
    }
  }
  uint64_t v8 = [v4 decodeInt64ForKey:@"lastMiLoLSLItems"];
  if (!v8)
  {
    v26 = [v4 error];

    if (v26) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"lastMiLoLSLItems"] & 1) == 0)
    {
      uint64_t v53 = *MEMORY[0x263F08320];
      v54 = @"Missing serialized value for IRStatisticsDO.lastMiLoLSLItems";
      char v21 = NSDictionary;
      v22 = &v54;
      v23 = &v53;
      goto LABEL_47;
    }
  }
  uint64_t v9 = [v4 decodeInt64ForKey:@"lastMiLoQualityReasonBitmap"];
  if (!v9)
  {
    v27 = [v4 error];

    if (v27) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"lastMiLoQualityReasonBitmap"] & 1) == 0)
    {
      uint64_t v51 = *MEMORY[0x263F08320];
      v52 = @"Missing serialized value for IRStatisticsDO.lastMiLoQualityReasonBitmap";
      char v21 = NSDictionary;
      v22 = &v52;
      v23 = &v51;
      goto LABEL_47;
    }
  }
  uint64_t v10 = [v4 decodeInt64ForKey:@"lastMiLoQuality"];
  if (!v10)
  {
    v28 = [v4 error];

    if (v28) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"lastMiLoQuality"] & 1) == 0)
    {
      uint64_t v49 = *MEMORY[0x263F08320];
      v50 = @"Missing serialized value for IRStatisticsDO.lastMiLoQuality";
      char v21 = NSDictionary;
      v22 = &v50;
      v23 = &v49;
      goto LABEL_47;
    }
  }
  uint64_t v11 = [v4 decodeInt64ForKey:@"lastMiLoModels"];
  if (!v11)
  {
    v29 = [v4 error];

    if (v29) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"lastMiLoModels"] & 1) == 0)
    {
      uint64_t v47 = *MEMORY[0x263F08320];
      v48 = @"Missing serialized value for IRStatisticsDO.lastMiLoModels";
      char v21 = NSDictionary;
      v22 = &v48;
      v23 = &v47;
      goto LABEL_47;
    }
  }
  uint64_t v38 = [v4 decodeInt64ForKey:@"timeInUpdatesModeInSeconds"];
  if (!v38)
  {
    v30 = [v4 error];

    if (v30) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"timeInUpdatesModeInSeconds"] & 1) == 0)
    {
      uint64_t v45 = *MEMORY[0x263F08320];
      v46 = @"Missing serialized value for IRStatisticsDO.timeInUpdatesModeInSeconds";
      char v21 = NSDictionary;
      v22 = &v46;
      v23 = &v45;
      goto LABEL_47;
    }
  }
  uint64_t v37 = [v4 decodeInt64ForKey:@"numberOfPickerChoiceEvents"];
  if (!v37)
  {
    v31 = [v4 error];

    if (v31) {
      goto LABEL_42;
    }
    if (([v4 containsValueForKey:@"numberOfPickerChoiceEvents"] & 1) == 0)
    {
      uint64_t v43 = *MEMORY[0x263F08320];
      v44 = @"Missing serialized value for IRStatisticsDO.numberOfPickerChoiceEvents";
      char v21 = NSDictionary;
      v22 = &v44;
      v23 = &v43;
      goto LABEL_47;
    }
  }
  uint64_t v36 = [v4 decodeInt64ForKey:@"numberOfCorrectPickerChoiceEvents"];
  if (v36) {
    goto LABEL_11;
  }
  v32 = [v4 error];

  if (!v32)
  {
    if ([v4 containsValueForKey:@"numberOfCorrectPickerChoiceEvents"])
    {
LABEL_11:
      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastClearDate"];
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = (objc_class *)objc_opt_class();
          v14 = NSStringFromClass(v13);
          v15 = (objc_class *)objc_opt_class();
          int v16 = NSStringFromClass(v15);
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRStatisticsDO key \"lastClearDate\" (expected %@, decoded %@)", v14, v16, 0];
          uint64_t v39 = *MEMORY[0x263F08320];
          v40 = v17;
          int v18 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRStatisticsDOOCNTErrorDomain" code:3 userInfo:v18];
          [v4 failWithError:v19];

LABEL_48:
          goto LABEL_49;
        }
      }
      else
      {
        v35 = [v4 error];

        if (v35)
        {
LABEL_49:
          v33 = 0;
          goto LABEL_50;
        }
      }
      self = [(IRStatisticsDO *)self initWithNumberOfContextChanges:v5 numberOfMiLoPredictions:v6 numberOfMiLoPredictionsInUpdatesMode:v7 lastMiLoLSLItems:v8 lastMiLoQualityReasonBitmap:v9 lastMiLoQuality:v10 lastMiLoModels:v11 timeInUpdatesModeInSeconds:v38 numberOfPickerChoiceEvents:v37 numberOfCorrectPickerChoiceEvents:v36 lastClearDate:v12];
      v33 = self;
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v41 = *MEMORY[0x263F08320];
    v42 = @"Missing serialized value for IRStatisticsDO.numberOfCorrectPickerChoiceEvents";
    char v21 = NSDictionary;
    v22 = &v42;
    v23 = &v41;
LABEL_47:
    v12 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
    v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRStatisticsDOOCNTErrorDomain" code:1 userInfo:v12];
    [v4 failWithError:v14];
    goto LABEL_48;
  }
LABEL_42:
  v33 = 0;
LABEL_51:

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:self->_numberOfContextChanges forKey:@"numberOfContextChanges"];
  [v5 encodeInt64:self->_numberOfMiLoPredictions forKey:@"numberOfMiLoPredictions"];
  [v5 encodeInt64:self->_numberOfMiLoPredictionsInUpdatesMode forKey:@"numberOfMiLoPredictionsInUpdatesMode"];
  [v5 encodeInt64:self->_lastMiLoLSLItems forKey:@"lastMiLoLSLItems"];
  [v5 encodeInt64:self->_lastMiLoQualityReasonBitmap forKey:@"lastMiLoQualityReasonBitmap"];
  [v5 encodeInt64:self->_lastMiLoQuality forKey:@"lastMiLoQuality"];
  [v5 encodeInt64:self->_lastMiLoModels forKey:@"lastMiLoModels"];
  [v5 encodeInt64:self->_timeInUpdatesModeInSeconds forKey:@"timeInUpdatesModeInSeconds"];
  [v5 encodeInt64:self->_numberOfPickerChoiceEvents forKey:@"numberOfPickerChoiceEvents"];
  [v5 encodeInt64:self->_numberOfCorrectPickerChoiceEvents forKey:@"numberOfCorrectPickerChoiceEvents"];
  lastClearDate = self->_lastClearDate;
  if (lastClearDate) {
    [v5 encodeObject:lastClearDate forKey:@"lastClearDate"];
  }
}

- (id)description
{
  id v14 = [NSString alloc];
  v13 = [NSNumber numberWithLongLong:self->_numberOfContextChanges];
  int64_t v3 = [NSNumber numberWithLongLong:self->_numberOfMiLoPredictions];
  id v4 = [NSNumber numberWithLongLong:self->_numberOfMiLoPredictionsInUpdatesMode];
  id v5 = [NSNumber numberWithLongLong:self->_lastMiLoLSLItems];
  uint64_t v6 = [NSNumber numberWithLongLong:self->_lastMiLoQualityReasonBitmap];
  uint64_t v7 = [NSNumber numberWithLongLong:self->_lastMiLoQuality];
  uint64_t v8 = [NSNumber numberWithLongLong:self->_lastMiLoModels];
  uint64_t v9 = [NSNumber numberWithLongLong:self->_timeInUpdatesModeInSeconds];
  uint64_t v10 = [NSNumber numberWithLongLong:self->_numberOfPickerChoiceEvents];
  uint64_t v11 = [NSNumber numberWithLongLong:self->_numberOfCorrectPickerChoiceEvents];
  v15 = (void *)[v14 initWithFormat:@"<IRStatisticsDO | numberOfContextChanges:%@ numberOfMiLoPredictions:%@ numberOfMiLoPredictionsInUpdatesMode:%@ lastMiLoLSLItems:%@ lastMiLoQualityReasonBitmap:%@ lastMiLoQuality:%@ lastMiLoModels:%@ timeInUpdatesModeInSeconds:%@ numberOfPickerChoiceEvents:%@ numberOfCorrectPickerChoiceEvents:%@ lastClearDate:%@>", v13, v3, v4, v5, v6, v7, v8, v9, v10, v11, self->_lastClearDate];

  return v15;
}

@end