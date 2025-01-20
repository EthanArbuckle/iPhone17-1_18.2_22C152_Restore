@interface DBSmartWidgetPrediction
+ (SEL)isEqualClassSelector;
+ (double)initialValidInterval;
+ (int64_t)_scoreFor:(double)a3 minValue:(double)a4 maxValue:(double)a5;
- (BOOL)_defaultIsEqualClass:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPrediction:(id)a3;
- (BOOL)showImageBorder;
- (BOOL)updateWithPrediction:(id)a3;
- (CAFilter)compositingFilter;
- (CARObserverHashTable)observers;
- (DBSmartWidgetPrediction)init;
- (DBSmartWidgetPredictionDelegate)delegate;
- (NSArray)validRanges;
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)uniqueIdentifier;
- (UIImage)image;
- (double)initialValidInterval;
- (double)maxValue;
- (double)minValue;
- (id)_debugScoreText;
- (id)actionBlock;
- (id)debugValidRangesText;
- (id)defaultValidRanges;
- (id)description;
- (id)predictedObjectDescription;
- (int64_t)compare:(id)a3;
- (int64_t)predictionScore;
- (int64_t)score;
- (int64_t)tieBreakScore;
- (void)addObserver:(id)a3;
- (void)invalidateValidIntervals;
- (void)predictionDidUpdate;
- (void)removeObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setValidRanges:(id)a3;
@end

@implementation DBSmartWidgetPrediction

- (DBSmartWidgetPrediction)init
{
  v6.receiver = self;
  v6.super_class = (Class)DBSmartWidgetPrediction;
  v2 = [(DBSmartWidgetPrediction *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1C7570];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;
  }
  return v2;
}

- (int64_t)score
{
  int64_t v2 = [(DBSmartWidgetPrediction *)self predictionScore];
  return [(id)objc_opt_class() baseScore] + v2;
}

- (NSArray)validRanges
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  validRanges = self->_validRanges;
  if (!validRanges)
  {
    v4 = objc_opt_new();
    [(DBSmartWidgetPrediction *)self initialValidInterval];
    if (v5 < 1.79769313e308)
    {
      objc_super v6 = [DBDateRange alloc];
      v7 = [MEMORY[0x263EFF910] distantPast];
      v8 = [MEMORY[0x263EFF910] date];
      [(DBSmartWidgetPrediction *)self initialValidInterval];
      v9 = objc_msgSend(v8, "dateByAddingTimeInterval:");
      v10 = [(DBDateRange *)v6 initWithStart:v7 end:v9];
      [v4 addObject:v10];
    }
    v11 = [(DBSmartWidgetPrediction *)self defaultValidRanges];
    [v4 addObjectsFromArray:v11];

    v12 = objc_opt_new();
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"SmartEngineCombineRangesInterval", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      double v14 = (double)AppIntegerValue;
    }
    else {
      double v14 = 60.0;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v21 = [v12 lastObject];
          if (v21
            && ([v20 startTimeIntervalSinceReferenceDate],
                double v23 = v22 - v14,
                [v21 endTimeIntervalSinceReferenceDate],
                v23 < v24))
          {
            [v21 endTimeIntervalSinceReferenceDate];
            double v26 = v25;
            [v20 endTimeIntervalSinceReferenceDate];
            if (v26 < v27)
            {
              v28 = [v20 end];
              [v21 setEnd:v28];
            }
          }
          else
          {
            [v12 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v17);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v29 = v12;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(v29);
          }
          -[DBSmartWidgetPrediction updateRangeIfNeeded:](self, "updateRangeIfNeeded:", *(void *)(*((void *)&v37 + 1) + 8 * j), (void)v37);
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v31);
    }

    v34 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.validRange == YES"];
    [(NSArray *)v29 filterUsingPredicate:v34];
    v35 = self->_validRanges;
    self->_validRanges = v29;

    validRanges = self->_validRanges;
  }
  return validRanges;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSmartWidgetPrediction *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSmartWidgetPrediction *)self observers];
  [v5 removeObserver:v4];
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_validRanges;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) description];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  v12 = [(DBSmartWidgetPrediction *)self uniqueIdentifier];
  v13 = [(DBSmartWidgetPrediction *)self title];
  double v14 = [(DBSmartWidgetPrediction *)self subtitle];
  id v15 = [(DBSmartWidgetPrediction *)self _debugScoreText];
  uint64_t v16 = [v3 componentsJoinedByString:@", "];
  uint64_t v17 = [(DBSmartWidgetPrediction *)self predictedObjectDescription];
  uint64_t v18 = [v10 stringWithFormat:@"<%@: %p uniqueIdentifier=%@ title=%@ subtitle=%@ score=%@ validRanges=[%@] predictedObject=%@>", v11, self, v12, v13, v14, v15, v16, v17, (void)v20];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DBSmartWidgetPrediction *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(DBSmartWidgetPrediction *)self isEqualToPrediction:v4];
  }

  return v5;
}

- (BOOL)isEqualToPrediction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(DBSmartWidgetPrediction *)self uniqueIdentifier],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v4 uniqueIdentifier],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqual:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(id)objc_opt_class() isEqualClassSelector];
    char v9 = ((uint64_t (*)(DBSmartWidgetPrediction *, uint64_t, id))[(DBSmartWidgetPrediction *)self methodForSelector:v8])(self, v8, v4);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(DBSmartWidgetPrediction *)self score];
  if (v5 == [v4 score])
  {
    if ([(DBSmartWidgetPrediction *)self isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = [(DBSmartWidgetPrediction *)self tieBreakScore];
      if (v6 > [v4 tieBreakScore])
      {
        int64_t v7 = -1;
        goto LABEL_11;
      }
      uint64_t v9 = [(DBSmartWidgetPrediction *)self tieBreakScore];
      if (v9 < [v4 tieBreakScore])
      {
        int64_t v7 = 1;
        goto LABEL_11;
      }
    }
    int64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [(DBSmartWidgetPrediction *)self score];
  if (v8 > [v4 score]) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = 1;
  }
LABEL_11:

  return v7;
}

- (id)_debugScoreText
{
  uint64_t v3 = NSString;
  int64_t v4 = [(DBSmartWidgetPrediction *)self score];
  int64_t v5 = [(DBSmartWidgetPrediction *)self tieBreakScore];
  int64_t v6 = [(DBSmartWidgetPrediction *)self predictionScore];
  uint64_t v7 = [(id)objc_opt_class() baseScore];
  [(DBSmartWidgetPrediction *)self value];
  uint64_t v9 = v8;
  [(DBSmartWidgetPrediction *)self minValue];
  uint64_t v11 = v10;
  [(DBSmartWidgetPrediction *)self maxValue];
  return (id)[v3 stringWithFormat:@"[%ld(%ld) pScore=%ld bScore=%ld value=%.2f minValue=%.2f maxValue=%.2f]", v4, v5, v6, v7, v9, v11, v12];
}

- (id)debugValidRangesText
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_validRanges;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = NSString;
        uint64_t v10 = [v8 start];
        uint64_t v11 = +[DBDateFormatter formattedTime:v10];
        uint64_t v12 = [v8 end];
        v13 = +[DBDateFormatter formattedTime:v12];
        double v14 = [v9 stringWithFormat:@"<%@ - %@>", v11, v13];
        [v3 addObject:v14];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  id v15 = NSString;
  uint64_t v16 = [v3 componentsJoinedByString:@"\n"];
  uint64_t v17 = [v15 stringWithFormat:@"%@", v16];

  return v17;
}

- (id)predictedObjectDescription
{
  int64_t v2 = NSString;
  uint64_t v3 = [(DBSmartWidgetPrediction *)self predictedObject];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)updateWithPrediction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetPrediction updateWithPrediction:]((uint64_t)self, v5);
  }

  uint64_t v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetPrediction updateWithPrediction:]((uint64_t)v4, v6);
  }

  return 0;
}

- (void)predictionDidUpdate
{
  id v3 = [(DBSmartWidgetPrediction *)self observers];
  [v3 predictionDidUpdate:self];
}

- (double)minValue
{
  int64_t v2 = objc_opt_class();
  [v2 minValue];
  return result;
}

- (double)maxValue
{
  int64_t v2 = objc_opt_class();
  [v2 maxValue];
  return result;
}

- (int64_t)predictionScore
{
  id v3 = objc_opt_class();
  [(DBSmartWidgetPrediction *)self value];
  double v5 = v4;
  [(DBSmartWidgetPrediction *)self minValue];
  double v7 = v6;
  [(DBSmartWidgetPrediction *)self maxValue];
  return [v3 _scoreFor:v5 minValue:v7 maxValue:v8];
}

+ (double)initialValidInterval
{
  return 1.79769313e308;
}

- (double)initialValidInterval
{
  int64_t v2 = objc_opt_class();
  [v2 initialValidInterval];
  return result;
}

- (id)defaultValidRanges
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)invalidateValidIntervals
{
  self->_validRanges = 0;
  MEMORY[0x270F9A758]();
}

+ (int64_t)_scoreFor:(double)a3 minValue:(double)a4 maxValue:(double)a5
{
  return (uint64_t)(0.0 - 10.0 / (a5 - a4) * a4 + 10.0 / (a5 - a4) * a3);
}

+ (SEL)isEqualClassSelector
{
  return sel__defaultIsEqualClass_;
}

- (BOOL)_defaultIsEqualClass:(id)a3
{
  return 1;
}

- (void)setValidRanges:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (CAFilter)compositingFilter
{
  return self->_compositingFilter;
}

- (BOOL)showImageBorder
{
  return self->_showImageBorder;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (int64_t)tieBreakScore
{
  return self->_tieBreakScore;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (DBSmartWidgetPredictionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSmartWidgetPredictionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_validRanges, 0);
}

- (void)updateWithPrediction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "update=%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updateWithPrediction:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "current=%{public}@", (uint8_t *)&v2, 0xCu);
}

@end