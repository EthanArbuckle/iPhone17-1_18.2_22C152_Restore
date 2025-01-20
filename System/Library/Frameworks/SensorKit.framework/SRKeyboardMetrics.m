@interface SRKeyboardMetrics
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSArray)deleteToDeletes;
- (NSArray)inputModes;
- (NSArray)longWordDownErrorDistance;
- (NSArray)longWordTouchDownDown;
- (NSArray)longWordTouchDownUp;
- (NSArray)longWordTouchUpDown;
- (NSArray)longWordUpErrorDistance;
- (NSArray)pathErrorDistanceRatio;
- (NSArray)sessionIdentifiers;
- (NSDateInterval)interval;
- (NSDictionary)keyboardMetaInformation;
- (NSInteger)emojiCountForSentimentCategory:(SRKeyboardMetricsSentimentCategory)category;
- (NSInteger)totalAlteredWords;
- (NSInteger)totalAutoCorrections;
- (NSInteger)totalDeletes;
- (NSInteger)totalDrags;
- (NSInteger)totalEmojis;
- (NSInteger)totalHitTestCorrections;
- (NSInteger)totalInsertKeyCorrections;
- (NSInteger)totalNearKeyCorrections;
- (NSInteger)totalPathPauses;
- (NSInteger)totalPaths;
- (NSInteger)totalPauses;
- (NSInteger)totalRetroCorrections;
- (NSInteger)totalSkipTouchCorrections;
- (NSInteger)totalSpaceCorrections;
- (NSInteger)totalSubstitutionCorrections;
- (NSInteger)totalTaps;
- (NSInteger)totalTranspositionCorrections;
- (NSInteger)totalTypingEpisodes;
- (NSInteger)totalWords;
- (NSInteger)wordCountForSentimentCategory:(SRKeyboardMetricsSentimentCategory)category;
- (NSMeasurement)height;
- (NSMeasurement)totalPathLength;
- (NSMeasurement)width;
- (NSMutableDictionary)mutablePositionalMetrics;
- (NSMutableDictionary)mutableProbabilityMetrics;
- (NSMutableDictionary)mutableScalarMetrics;
- (NSString)description;
- (NSString)keyboardIdentifier;
- (NSString)version;
- (NSTimeInterval)duration;
- (NSTimeInterval)totalPathTime;
- (NSTimeInterval)totalTypingDuration;
- (SRKeyboardMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRKeyboardMetrics)initWithCoder:(id)a3;
- (SRKeyboardMetrics)initWithInterval:(id)a3 metaInformation:(id)a4;
- (SRKeyboardProbabilityMetric)anyTapToCharKey;
- (SRKeyboardProbabilityMetric)anyTapToPlaneChangeKey;
- (SRKeyboardProbabilityMetric)charKeyToAnyTapKey;
- (SRKeyboardProbabilityMetric)charKeyToDelete;
- (SRKeyboardProbabilityMetric)charKeyToPlaneChangeKey;
- (SRKeyboardProbabilityMetric)charKeyToPrediction;
- (SRKeyboardProbabilityMetric)charKeyToSpaceKey;
- (SRKeyboardProbabilityMetric)deleteDownErrorDistance;
- (SRKeyboardProbabilityMetric)deleteToCharKey;
- (SRKeyboardProbabilityMetric)deleteToDelete;
- (SRKeyboardProbabilityMetric)deleteToPath;
- (SRKeyboardProbabilityMetric)deleteToPlaneChangeKey;
- (SRKeyboardProbabilityMetric)deleteToShiftKey;
- (SRKeyboardProbabilityMetric)deleteToSpaceKey;
- (SRKeyboardProbabilityMetric)deleteTouchDownUp;
- (SRKeyboardProbabilityMetric)deleteUpErrorDistance;
- (SRKeyboardProbabilityMetric)downErrorDistance;
- (SRKeyboardProbabilityMetric)pathToDelete;
- (SRKeyboardProbabilityMetric)pathToPath;
- (SRKeyboardProbabilityMetric)pathToSpace;
- (SRKeyboardProbabilityMetric)planeChangeKeyToCharKey;
- (SRKeyboardProbabilityMetric)planeChangeToAnyTap;
- (SRKeyboardProbabilityMetric)shortWordCharKeyDownErrorDistance;
- (SRKeyboardProbabilityMetric)shortWordCharKeyToCharKey;
- (SRKeyboardProbabilityMetric)shortWordCharKeyTouchDownUp;
- (SRKeyboardProbabilityMetric)shortWordCharKeyUpErrorDistance;
- (SRKeyboardProbabilityMetric)spaceDownErrorDistance;
- (SRKeyboardProbabilityMetric)spaceToCharKey;
- (SRKeyboardProbabilityMetric)spaceToDeleteKey;
- (SRKeyboardProbabilityMetric)spaceToPath;
- (SRKeyboardProbabilityMetric)spaceToPlaneChangeKey;
- (SRKeyboardProbabilityMetric)spaceToPredictionKey;
- (SRKeyboardProbabilityMetric)spaceToShiftKey;
- (SRKeyboardProbabilityMetric)spaceToSpaceKey;
- (SRKeyboardProbabilityMetric)spaceTouchDownUp;
- (SRKeyboardProbabilityMetric)spaceUpErrorDistance;
- (SRKeyboardProbabilityMetric)touchDownDown;
- (SRKeyboardProbabilityMetric)touchDownUp;
- (SRKeyboardProbabilityMetric)touchUpDown;
- (SRKeyboardProbabilityMetric)upErrorDistance;
- (double)pathTypingSpeed;
- (double)typingSpeed;
- (id)binarySampleRepresentation;
- (id)positionalMetrics;
- (id)probabilityMetrics;
- (id)scalarMetrics;
- (id)sr_dictionaryRepresentation;
- (int64_t)totalAbsolutistWords;
- (int64_t)totalAngerEmojis;
- (int64_t)totalAngerWords;
- (int64_t)totalAnxietyEmojis;
- (int64_t)totalAnxietyWords;
- (int64_t)totalConfusedEmojis;
- (int64_t)totalDeathWords;
- (int64_t)totalDownWords;
- (int64_t)totalHealthFeelingEmojis;
- (int64_t)totalHealthFeelingWords;
- (int64_t)totalLowEnergyEmojis;
- (int64_t)totalPositiveEmojis;
- (int64_t)totalSadEmojis;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setInterval:(id)a3;
- (void)setKeyboardMetaInformation:(id)a3;
- (void)setMutablePositionalMetrics:(id)a3;
- (void)setMutableProbabilityMetrics:(id)a3;
- (void)setMutableScalarMetrics:(id)a3;
@end

@implementation SRKeyboardMetrics

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogKeyboardMetrics = (uint64_t)os_log_create("com.apple.SensorKit", "SRKeyboardMetrics");
  }
}

- (SRKeyboardMetrics)initWithInterval:(id)a3 metaInformation:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SRKeyboardMetrics;
  v6 = [(SRKeyboardMetrics *)&v8 init];
  if (v6)
  {
    v6->_mutableScalarMetrics = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_mutablePositionalMetrics = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_mutableProbabilityMetrics = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_interval = (NSDateInterval *)a3;
    v6->_keyboardMetaInformation = (NSDictionary *)a4;
  }
  return v6;
}

- (void)dealloc
{
  [(SRKeyboardMetrics *)self setInterval:0];
  [(SRKeyboardMetrics *)self setMutableScalarMetrics:0];
  [(SRKeyboardMetrics *)self setMutablePositionalMetrics:0];
  [(SRKeyboardMetrics *)self setMutableProbabilityMetrics:0];
  [(SRKeyboardMetrics *)self setKeyboardMetaInformation:0];
  v3.receiver = self;
  v3.super_class = (Class)SRKeyboardMetrics;
  [(SRKeyboardMetrics *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = -[NSDateInterval isEqual:](self->_interval, "isEqual:", [a3 interval]);
      if (v5)
      {
        int v5 = -[NSDictionary isEqual:](self->_keyboardMetaInformation, "isEqual:", [a3 keyboardMetaInformation]);
        if (v5)
        {
          int v5 = -[NSMutableDictionary isEqual:](self->_mutableScalarMetrics, "isEqual:", [a3 mutableScalarMetrics]);
          if (v5)
          {
            int v5 = -[NSMutableDictionary isEqual:](self->_mutablePositionalMetrics, "isEqual:", [a3 mutablePositionalMetrics]);
            if (v5)
            {
              mutableProbabilityMetrics = self->_mutableProbabilityMetrics;
              uint64_t v7 = [a3 mutableProbabilityMetrics];
              LOBYTE(v5) = [(NSMutableDictionary *)mutableProbabilityMetrics isEqual:v7];
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (NSTimeInterval)duration
{
  [[(NSDateInterval *)self->_interval endDate] srAbsoluteTime];
  double v4 = v3;
  [[(NSDateInterval *)self->_interval startDate] srAbsoluteTime];
  return v4 - v5;
}

- (NSString)keyboardIdentifier
{
  return (NSString *)[(NSDictionary *)self->_keyboardMetaInformation objectForKeyedSubscript:@"SRKeyboardMetaInformationIdentifierKey"];
}

- (NSArray)sessionIdentifiers
{
  result = [(NSDictionary *)self->_keyboardMetaInformation objectForKeyedSubscript:@"SRKeyboardMetaInformationSessionIdentifiersKey"];
  if (!result) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  return result;
}

- (NSString)version
{
  return (NSString *)[(NSDictionary *)self->_keyboardMetaInformation objectForKeyedSubscript:@"SRKeyboardMetaInformationVersionKey"];
}

- (NSArray)inputModes
{
  v4[1] = *MEMORY[0x263EF8340];
  v2 = [(NSDictionary *)self->_keyboardMetaInformation objectForKeyedSubscript:@"SRKeyboardMetaInformationInputModesKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4[0] = v2;
    return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else if (v2)
  {
    return v2;
  }
  else
  {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (NSMeasurement)width
{
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_keyboardMetaInformation, "objectForKeyedSubscript:", @"SRKeyboardMetaInformationWidthKey"), "doubleValue");
  double v3 = v2;
  id v4 = objc_alloc(MEMORY[0x263F08980]);
  double v5 = objc_msgSend(v4, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CE8], "millimeters"), v3);

  return (NSMeasurement *)v5;
}

- (NSMeasurement)height
{
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_keyboardMetaInformation, "objectForKeyedSubscript:", @"SRKeyboardMetaInformationHeightKey"), "doubleValue");
  double v3 = v2;
  id v4 = objc_alloc(MEMORY[0x263F08980]);
  double v5 = objc_msgSend(v4, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CE8], "millimeters"), v3);

  return (NSMeasurement *)v5;
}

- (NSString)description
{
  double v3 = NSString;
  id v4 = [(NSDictionary *)self->_keyboardMetaInformation objectForKeyedSubscript:@"SRKeyboardMetaInformationVersionKey"];
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_keyboardMetaInformation, "objectForKeyedSubscript:", @"SRKeyboardMetaInformationWidthKey"), "doubleValue");
  uint64_t v6 = v5;
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_keyboardMetaInformation, "objectForKeyedSubscript:", @"SRKeyboardMetaInformationHeightKey"), "doubleValue");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"Metadata: { version: %@, width: %f, height: %f, orientation: %@, inputModes: %@, session identifiers:%@ }, Interval: %@ - %@, Scalar Metrics: %@, Probability Metrics: %@, Positional Metrics: %@", v4, v6, v7, -[NSDictionary objectForKeyedSubscript:](self->_keyboardMetaInformation, "objectForKeyedSubscript:", @"SRKeyboardMetaInformationOrientationKey"), -[SRKeyboardMetrics inputModes](self, "inputModes"), -[SRKeyboardMetrics sessionIdentifiers](self, "sessionIdentifiers"), -[NSDateInterval startDate](self->_interval, "startDate"), -[NSDateInterval endDate](self->_interval, "endDate"), -[SRKeyboardMetrics scalarMetrics](self, "scalarMetrics"), -[SRKeyboardMetrics probabilityMetrics](self, "probabilityMetrics"), objc_msgSend((id)objc_msgSend(-[SRKeyboardMetrics positionalMetrics](self, "positionalMetrics"),
                               "allValues"),
                         "componentsJoinedByString:",
                         @"\n"));
}

- (id)scalarMetrics
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_mutableScalarMetrics];
}

- (id)positionalMetrics
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_mutablePositionalMetrics];
}

- (id)probabilityMetrics
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_mutableProbabilityMetrics];
}

- (NSInteger)wordCountForSentimentCategory:(SRKeyboardMetricsSentimentCategory)category
{
  if ((unint64_t)category > SRKeyboardMetricsSentimentCategoryPositive) {
    return 0;
  }
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableScalarMetrics, "objectForKeyedSubscript:", *off_26452E8A0[category], v3);
  return [v5 integerValue];
}

- (NSInteger)emojiCountForSentimentCategory:(SRKeyboardMetricsSentimentCategory)category
{
  if ((unint64_t)(category - 3) > 6) {
    return 0;
  }
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableScalarMetrics, "objectForKeyedSubscript:", *off_26452E8D8[category - 3], v3);
  return [v5 integerValue];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRKeyboardMetrics)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRKeyboardMetrics.m", 270, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v22.receiver = self;
  v22.super_class = (Class)SRKeyboardMetrics;
  uint64_t v6 = [(SRKeyboardMetrics *)&v22 init];
  if (v6)
  {
    v6->_interval = (NSDateInterval *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Interval"];
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v6->_keyboardMetaInformation = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), @"MetaInformation"), "copy");
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v6->_mutableScalarMetrics = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0), @"scalar"), "mutableCopy");
    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v6->_mutableProbabilityMetrics = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), @"probability"), "mutableCopy");
    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v6->_mutablePositionalMetrics = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0), @"positional"), "mutableCopy");
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRKeyboardMetrics.m", 283, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_interval forKey:@"Interval"];
  [a3 encodeObject:self->_keyboardMetaInformation forKey:@"MetaInformation"];
  objc_msgSend(a3, "encodeObject:forKey:", -[SRKeyboardMetrics mutableScalarMetrics](self, "mutableScalarMetrics"), @"scalar");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRKeyboardMetrics probabilityMetrics](self, "probabilityMetrics"), @"probability");
  id v6 = [(SRKeyboardMetrics *)self positionalMetrics];

  [a3 encodeObject:v6 forKey:@"positional"];
}

- (SRKeyboardMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a3, "length", a5))
  {
    v13.receiver = self;
    v13.super_class = (Class)SRKeyboardMetrics;
    result = [(SRKeyboardMetrics *)&v13 init];
    if (!result) {
      return result;
    }
    self = result;
    uint64_t v12 = 0;
    uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v12];
    uint64_t v9 = v12;
    if (!v12)
    {
      v11 = (void *)v8;

      return (SRKeyboardMetrics *)v11;
    }
    uint64_t v10 = SRLogKeyboardMetrics;
    if (os_log_type_enabled((os_log_t)SRLogKeyboardMetrics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive data because %{public}@", buf, 0xCu);
    }
  }

  return 0;
}

- (id)binarySampleRepresentation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  double v2 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  if (v7)
  {
    uint64_t v3 = SRLogKeyboardMetrics;
    if (os_log_type_enabled((os_log_t)SRLogKeyboardMetrics, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ object because %{public}@", buf, 0x16u);
    }
  }
  return v2;
}

- (NSInteger)totalWords
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalWordsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalAlteredWords
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalAlteredWordsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalTaps
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalTapsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalDrags
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalDragsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalDeletes
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalDeletesKey"];

  return [v2 integerValue];
}

- (NSInteger)totalEmojis
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalEmojiKey"];

  return [v2 integerValue];
}

- (NSInteger)totalPaths
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalPathsKey"];

  return [v2 integerValue];
}

- (NSTimeInterval)totalPathTime
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalPathTimeKey"];

  [v2 doubleValue];
  return result;
}

- (NSMeasurement)totalPathLength
{
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableScalarMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricScalarTotalPathLengthKey"), "doubleValue");
  double v3 = v2;
  id v4 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v5 = objc_msgSend(v4, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CE8], "millimeters"), v3);

  return (NSMeasurement *)v5;
}

- (NSInteger)totalAutoCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalAutoCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalSpaceCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalSpaceCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalRetroCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalRetroCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalTranspositionCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalTranspositionCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalInsertKeyCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalInsertKeyCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalSkipTouchCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalSkipTouchCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalNearKeyCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalNearKeyCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalSubstitutionCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalSubstitutionCorrectionsKey"];

  return [v2 integerValue];
}

- (NSInteger)totalHitTestCorrections
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalHitTestCorrectionsKey"];

  return [v2 integerValue];
}

- (NSTimeInterval)totalTypingDuration
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTotalSessionTypingDurationKey"];

  [v2 doubleValue];
  return result;
}

- (int64_t)totalAbsolutistWords
{
  return [(SRKeyboardMetrics *)self wordCountForSentimentCategory:0];
}

- (int64_t)totalDownWords
{
  return [(SRKeyboardMetrics *)self wordCountForSentimentCategory:1];
}

- (int64_t)totalDeathWords
{
  return [(SRKeyboardMetrics *)self wordCountForSentimentCategory:2];
}

- (int64_t)totalAnxietyWords
{
  return [(SRKeyboardMetrics *)self wordCountForSentimentCategory:3];
}

- (int64_t)totalAngerWords
{
  return [(SRKeyboardMetrics *)self wordCountForSentimentCategory:4];
}

- (int64_t)totalHealthFeelingWords
{
  return [(SRKeyboardMetrics *)self wordCountForSentimentCategory:5];
}

- (int64_t)totalPositiveEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:6];
}

- (int64_t)totalSadEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:7];
}

- (int64_t)totalAnxietyEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:3];
}

- (int64_t)totalAngerEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:4];
}

- (int64_t)totalHealthFeelingEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:5];
}

- (int64_t)totalLowEnergyEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:8];
}

- (int64_t)totalConfusedEmojis
{
  return [(SRKeyboardMetrics *)self emojiCountForSentimentCategory:9];
}

- (NSInteger)totalPathPauses
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarMidPathPauseKey"];

  return [v2 integerValue];
}

- (double)typingSpeed
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTapTypingSpeedKey"];

  [v2 doubleValue];
  return result;
}

- (double)pathTypingSpeed
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarPathTypingSpeed"];

  [v2 doubleValue];
  return result;
}

- (NSInteger)totalPauses
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarTypingPausesKey"];

  return [v2 integerValue];
}

- (NSInteger)totalTypingEpisodes
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableScalarMetrics objectForKeyedSubscript:@"SRKeyboardMetricScalarEpisodeCountKey"];

  return [v2 integerValue];
}

- (SRKeyboardProbabilityMetric)upErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityUpErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)downErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDownErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceUpErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceUpErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceDownErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceDownErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteUpErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteUpErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteDownErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteDownErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)shortWordCharKeyUpErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)shortWordCharKeyDownErrorDistance
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08CE8] millimeters]);
  return v2;
}

- (SRKeyboardProbabilityMetric)touchDownUp
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityTouchDownUpKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceTouchDownUp
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceTouchDownUpKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteTouchDownUp
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteTouchDownUpKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)shortWordCharKeyTouchDownUp
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)touchDownDown
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityTouchDownDownKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)touchUpDown
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityTouchUpDownKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)charKeyToPrediction
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityCharKeyToPredictionKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)shortWordCharKeyToCharKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)charKeyToAnyTapKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityCharKeyToAnyTapKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)anyTapToCharKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityAnyTapToCharKeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToCharKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceToCharKeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)charKeyToSpaceKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityCharKeyToSpaceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToDeleteKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceToDeleteKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteToSpaceKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteToSpaceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToSpaceKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceToSpaceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToShiftKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceToShiftKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToPlaneChangeKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceTo123KeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToPredictionKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceToPredictionKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteToCharKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteToCharKeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)charKeyToDelete
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityCharKeyToDeleteKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteToDelete
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteToDeleteKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteToShiftKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteToShiftKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)deleteToPlaneChangeKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteTo123KeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)anyTapToPlaneChangeKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityAnyTapTo123KeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)planeChangeToAnyTap
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbability123KeyToAnyTapKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)charKeyToPlaneChangeKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityCharKeyTo123KeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)planeChangeKeyToCharKey
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbability123KeyToCharKeyKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (NSArray)pathErrorDistanceRatio
{
  double v2 = (void *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityPathErrorDistanceKey"];
  double v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [v2 mutableSampleValues];

  return (NSArray *)[v3 arrayWithArray:v4];
}

- (SRKeyboardProbabilityMetric)deleteToPath
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityDeleteToPathKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)pathToDelete
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityPathToDeleteKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)spaceToPath
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilitySpaceToPathKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)pathToSpace
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityCharKeyToSpaceKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (SRKeyboardProbabilityMetric)pathToPath
{
  double v2 = (SRKeyboardProbabilityMetric *)[(NSMutableDictionary *)self->_mutableProbabilityMetrics objectForKeyedSubscript:@"SRKeyboardMetricProbabilityPathToPathKey"];
  -[SRKeyboardProbabilityMetric setUnitType:](v2, "setUnitType:", [MEMORY[0x263F08C98] seconds]);
  return v2;
}

- (NSArray)longWordUpErrorDistance
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_mutablePositionalMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricPositionalWordUpErrorDistanceKey"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setUnitType:", objc_msgSend(MEMORY[0x263F08CE8], "millimeters"));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

- (NSArray)longWordDownErrorDistance
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_mutablePositionalMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricPositionalWordDownErrorDistanceKey"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setUnitType:", objc_msgSend(MEMORY[0x263F08CE8], "millimeters"));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

- (NSArray)longWordTouchDownUp
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_mutablePositionalMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricPositionalWordTouchDownUpKey"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setUnitType:", objc_msgSend(MEMORY[0x263F08C98], "seconds"));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

- (NSArray)longWordTouchDownDown
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_mutablePositionalMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricPositionalWordTouchDownDownKey"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setUnitType:", objc_msgSend(MEMORY[0x263F08C98], "seconds"));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

- (NSArray)longWordTouchUpDown
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_mutablePositionalMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricPositionalWordTouchUpDownKey"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setUnitType:", objc_msgSend(MEMORY[0x263F08C98], "seconds"));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

- (NSArray)deleteToDeletes
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_mutablePositionalMetrics, "objectForKeyedSubscript:", @"SRKeyboardMetricPositionalDeleteToDeleteKey"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setUnitType:", objc_msgSend(MEMORY[0x263F08C98], "seconds"));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_mutableProbabilityMetrics, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  mutableProbabilityMetrics = self->_mutableProbabilityMetrics;
  uint64_t v5 = [(NSMutableDictionary *)mutableProbabilityMetrics countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(mutableProbabilityMetrics);
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableProbabilityMetrics, "objectForKeyedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * i)), "mutableSampleValues"), *(void *)(*((void *)&v35 + 1) + 8 * i));
      }
      uint64_t v6 = [(NSMutableDictionary *)mutableProbabilityMetrics countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v6);
  }
  long long v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_mutablePositionalMetrics, "count", v3));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = self->_mutablePositionalMetrics;
  uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v15 = (void *)[MEMORY[0x263EFF980] array];
        [v9 setObject:v15 forKeyedSubscript:v14];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v16 = (void *)[(NSMutableDictionary *)self->_mutablePositionalMetrics objectForKeyedSubscript:v14];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v41 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t k = 0; k != v18; ++k)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v15, "addObject:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "mutableSampleValues"));
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v41 count:16];
          }
          while (v18);
        }
      }
      uint64_t v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v11);
  }
  id v21 = (id)objc_opt_new();
  [v21 setUnitOptions:1];
  mutableScalarMetrics = (NSMutableDictionary *)MEMORY[0x263EFFA78];
  if (self->_mutableScalarMetrics) {
    mutableScalarMetrics = self->_mutableScalarMetrics;
  }
  v39[0] = @"scalar";
  v39[1] = @"probability";
  v40[0] = mutableScalarMetrics;
  v40[1] = v25;
  v40[2] = v9;
  v39[2] = @"positional";
  v39[3] = @"metricsDuration";
  v23 = NSNumber;
  [(SRKeyboardMetrics *)self duration];
  v40[3] = objc_msgSend(v23, "numberWithDouble:");
  v39[4] = @"keyboardIdentifier";
  v40[4] = [(SRKeyboardMetrics *)self keyboardIdentifier];
  v39[5] = @"version";
  v40[5] = [(SRKeyboardMetrics *)self version];
  v39[6] = @"width";
  v40[6] = objc_msgSend(v21, "stringFromMeasurement:", -[SRKeyboardMetrics width](self, "width"));
  v39[7] = @"height";
  v40[7] = objc_msgSend(v21, "stringFromMeasurement:", -[SRKeyboardMetrics height](self, "height"));
  v39[8] = @"inputModes";
  v40[8] = [(SRKeyboardMetrics *)self inputModes];
  v39[9] = @"sessionIdentifiers";
  v40[9] = [(SRKeyboardMetrics *)self sessionIdentifiers];
  return (id)[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:10];
}

- (NSDateInterval)interval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInterval:(id)a3
{
}

- (NSDictionary)keyboardMetaInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyboardMetaInformation:(id)a3
{
}

- (NSMutableDictionary)mutableScalarMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMutableScalarMetrics:(id)a3
{
}

- (NSMutableDictionary)mutablePositionalMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMutablePositionalMetrics:(id)a3
{
}

- (NSMutableDictionary)mutableProbabilityMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMutableProbabilityMetrics:(id)a3
{
}

@end