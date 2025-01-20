@interface _DKEvent
+ (BOOL)copyMetadata:(id)a3 toManagedObject:(id)a4;
+ (BOOL)isValidURL:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (_DKEvent)eventWithInteraction:(id)a3 bundleIdentifier:(id)a4 storeKeyImage:(BOOL)a5;
+ (_DKEvent)eventWithRelevantShortcut:(id)a3 bundleID:(id)a4;
+ (_DKEvent)eventWithSearchableItem:(id)a3 bundleIdentifier:(id)a4;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 categoryIntegerValue:(int64_t)a7 confidence:(double)a8 metadata:(id)a9;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 categoryIntegerValue:(int64_t)a7 metadata:(id)a8;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 identifierStringValue:(id)a7 confidence:(double)a8 metadata:(id)a9;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 identifierStringValue:(id)a7 metadata:(id)a8;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 quantityDoubleValue:(double)a7 confidence:(double)a8 metadata:(id)a9;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 quantityDoubleValue:(double)a7 metadata:(id)a8;
+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9;
+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 categoryIntegerValue:(int64_t)a6 metadata:(id)a7;
+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 identifierStringValue:(id)a6 metadata:(id)a7;
+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 quantityDoubleValue:(double)a6 metadata:(id)a7;
+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6;
+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6 confidence:(double)a7 metadata:(id)a8;
+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6 metadata:(id)a7;
+ (id)allowedWebpageURLSchemes;
+ (id)entityName;
+ (id)eventRepresentingUserActivityWithSearchableItem:(id)a3 bundleIdentifier:(id)a4;
+ (id)eventStreamFromManagedObject:(id)a3 forValue:(id)a4 cache:(id)a5;
+ (id)eventValueFromManagedObject:(id)a3 streamName:(id)a4 readMetadata:(BOOL)a5 excludedMetadataKeys:(id)a6 cache:(id)a7;
+ (id)fetchCustomMetadataWithName:(id)a3 valueHash:(id)a4 context:(id)a5;
+ (id)fromPBCodable:(id)a3;
+ (id)fromPBCodable:(id)a3 skipMetadata:(BOOL)a4;
+ (id)keyPathForMOKeyPath:(uint64_t)a1;
+ (id)metadataForInteraction:(id)a3 storeKeyImage:(BOOL)a4;
+ (id)moKeyPathForKeyPath:(uint64_t)a1;
+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6;
+ (id)relatedContactIdentifiersFromIntent:(id)a3;
+ (id)uncachedEventValueFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6;
- (BOOL)BOOLValue;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSync;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (NSString)description;
- (NSTimeZone)timeZone;
- (_DKEvent)initWithCoder:(id)a3;
- (_DKEvent)initWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9;
- (_DKEventStream)stream;
- (_DKObject)value;
- (double)confidence;
- (double)doubleValue;
- (id)_initWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9;
- (id)interaction;
- (id)metadataFromCustomMetadata:(id)a3;
- (id)metadataFromCustomMetadata:(id)a3 cache:(id)a4;
- (id)metadataFromStructuredMetadata:(id)a3 excludedMetadataKeys:(id)a4;
- (id)metadataFromStructuredMetadata:(id)a3 excludedMetadataKeys:(id)a4 cache:(id)a5;
- (id)primaryValue;
- (id)relevantShortcut;
- (id)stringValue;
- (id)toPBCodable;
- (id)toPBCodableUseStructuredMetadata:(BOOL)a3;
- (int64_t)compareValue:(id)a3;
- (int64_t)compatibilityVersion;
- (int64_t)integerValue;
- (unint64_t)eventValueClassOf:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchInteractionWithPopulatedKeyImage:(id)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setConfidence:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setShouldSync:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStream:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _DKEvent

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_DKEvent;
  [(_DKObject *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_stream forKey:@"stream"];
  [v4 encodeObject:self->_startDate forKey:@"startDate"];
  [v4 encodeObject:self->_endDate forKey:@"endDate"];
  [v4 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v4 encodeDouble:@"confidence" forKey:self->_confidence];
  [v4 encodeBool:self->_shouldSync forKey:@"shouldSync"];
  [v4 encodeObject:self->_value forKey:@"value"];
  [v4 encodeInt64:self->_compatibilityVersion forKey:@"compatibilityVersion"];
  metadata = self->_metadata;
  if (metadata && [(NSDictionary *)metadata count]) {
    [v4 encodeObject:self->_metadata forKey:@"metadata"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (id)toPBCodableUseStructuredMetadata:(BOOL)a3
{
  BOOL v50 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(_DKPREvent);
  v5 = [(_DKEvent *)self startDate];
  [v5 timeIntervalSinceReferenceDate];
  -[_DKPREvent setStartDate:]((uint64_t)v4, v6);

  v7 = [(_DKEvent *)self endDate];
  [v7 timeIntervalSinceReferenceDate];
  -[_DKPREvent setEndDate:]((uint64_t)v4, v8);

  v9 = [(_DKEvent *)self value];
  v10 = [v9 toPBCodable];
  -[_DKPREvent setValue:]((uint64_t)v4, v10);

  v11 = [(_DKEvent *)self stream];
  v12 = [v11 toPBCodable];
  -[_DKPREvent setStream:]((uint64_t)v4, v12);

  v13 = [(_DKObject *)self UUID];
  v14 = [v13 UUIDString];
  -[_DKPREvent setIdentifier:]((uint64_t)v4, v14);

  v15 = [(_DKObject *)self source];
  v16 = [v15 toPBCodable];
  -[_DKPREvent setSource:]((uint64_t)v4, v16);

  v17 = [(_DKObject *)self creationDate];
  [v17 timeIntervalSinceReferenceDate];
  -[_DKPREvent setCreationDate:]((uint64_t)v4, v18);

  v19 = [(_DKEvent *)self timeZone];

  if (v19)
  {
    v20 = [(_DKEvent *)self timeZone];
    -[_DKPREvent setTimeZone:]((uint64_t)v4, [v20 secondsFromGMT]);
  }
  if ([(_DKEvent *)self compatibilityVersion]) {
    -[_DKPREvent setCompatibilityVersion:]((uint64_t)v4, [(_DKEvent *)self compatibilityVersion]);
  }
  [(_DKEvent *)self confidence];
  if (v21 != 1.0)
  {
    [(_DKEvent *)self confidence];
    -[_DKPREvent setConfidence:]((uint64_t)v4, v22);
  }
  uint64_t v23 = [(_DKEvent *)self metadata];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(_DKEvent *)self metadata];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = [(_DKEvent *)self metadata];
      uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        v29 = self;
        uint64_t v30 = *(void *)v52;
        v47 = &v56;
        unint64_t v31 = 0x1E560C000uLL;
        do
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v52 != v30) {
              objc_enumerationMutation(obj);
            }
            v33 = *(void **)(*((void *)&v51 + 1) + 8 * v32);
            v34 = [(_DKEvent *)v29 metadata];
            v35 = [v34 objectForKeyedSubscript:v33];

            id v36 = objc_alloc_init(*(Class *)(v31 + 3624));
            if (!v50) {
              goto LABEL_17;
            }
            +[_DKMetadataPersistenceLookupTable keyToIndex]();
            v49 = v35;
            uint64_t v37 = v28;
            uint64_t v38 = v30;
            unint64_t v39 = v31;
            v40 = v29;
            v42 = v41 = v4;
            v43 = [v42 objectForKeyedSubscript:v33];

            id v4 = v41;
            v29 = v40;
            unint64_t v31 = v39;
            uint64_t v30 = v38;
            uint64_t v28 = v37;
            v35 = v49;
            if (v43)
            {
              -[_DKPRMetadataEntry setIndex:]((uint64_t)v36, [v43 unsignedIntValue]);
              -[_DKPRMetadataEntry setKey:]((uint64_t)v36, &stru_1EDDE58B8);
            }
            else
            {
LABEL_17:
              -[_DKPRMetadataEntry setKey:]((uint64_t)v36, v33);
            }
            v44 = [v35 toPBCodable];
            -[_DKPRMetadataEntry setValue:]((uint64_t)v36, v44);

            v45 = -[_DKPRMetadataEntry value]((uint64_t)v36);

            if (v45)
            {
              -[_DKPREvent addMetadata:]((uint64_t)v4, v36);
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              [(_DKEvent(Protobuf) *)buf toPBCodableUseStructuredMetadata:v47];
            }

            ++v32;
          }
          while (v28 != v32);
          uint64_t v28 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v28);
      }
    }
  }
  return v4;
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void)setTimeZone:(id)a3
{
}

- (void)setShouldSync:(BOOL)a3
{
  self->_shouldSync = a3;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  double v21 = [[_DKEvent alloc] initWithStream:v20 source:v19 startDate:v18 endDate:v17 value:v16 confidence:v15 metadata:a8];

  return v21;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_DKEvent alloc] initWithStream:v12 source:0 startDate:v11 endDate:v10 value:v9 confidence:0 metadata:1.0];

  return v13;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6 metadata:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[_DKEvent alloc] initWithStream:v15 source:0 startDate:v14 endDate:v13 value:v12 confidence:v11 metadata:1.0];

  return v16;
}

- (id)stringValue
{
  v2 = [(_DKEvent *)self value];
  v3 = [v2 stringValue];

  return v3;
}

- (int64_t)compareValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double v6 = [(_DKEvent *)self value];
    int v7 = [v6 conformsToProtocol:&unk_1EDE26350];

    if (!v7)
    {
LABEL_11:
      int64_t v10 = -1;
      goto LABEL_12;
    }
    double v8 = [(_DKEvent *)self value];
    id v9 = [v5 value];
    int64_t v10 = [v8 compareValue:v9];

    if (!v10)
    {
      id v11 = [(_DKEvent *)self metadata];
      if (v11)
      {

        goto LABEL_8;
      }
      int64_t v10 = [v5 metadata];

      if (v10)
      {
LABEL_8:
        id v12 = [(_DKEvent *)self metadata];

        if (v12)
        {
          id v13 = [v5 metadata];

          if (v13)
          {
            id v14 = [(_DKEvent *)self metadata];
            id v15 = [v5 metadata];
            unsigned int v16 = [v14 isEqualToDictionary:v15];

            int64_t v10 = v16 - 1;
          }
          else
          {
            int64_t v10 = 1;
          }
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  int64_t v10 = -1;
LABEL_13:

  return v10;
}

- (_DKObject)value
{
  return (_DKObject *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)keyPathForMOKeyPath:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 componentsSeparatedByString:@"."];
  if ((unint64_t)[v3 count] < 2)
  {
    if ([v2 hasPrefix:@"value"])
    {
      int64_t v10 = [v2 substringFromIndex:objc_msgSend(@"value", "length")];
      id v11 = [v10 substringToIndex:1];
      id v12 = [v11 lowercaseString];
      id v13 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", 0, 1, v12);

      id v9 = [NSString stringWithFormat:@"value.%@Value", v13];
    }
    else
    {
      id v9 = v2;
    }
  }
  else
  {
    id v4 = [v3 firstObject];
    int v5 = [v4 isEqualToString:@"structuredMetadata"];

    if (v5)
    {
      double v6 = +[_DKMetadataPersistenceLookupTable attributeToKey]();
      int v7 = [v3 lastObject];
      double v8 = [v6 objectForKeyedSubscript:v7];

      if (v8)
      {
        id v9 = [NSString stringWithFormat:@"metadata.%@", v8];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (_DKEvent)initWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  uint64_t v22 = [v16 eventValueType];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = objc_opt_class();
    v25 = [v16 eventValueType];
    LOBYTE(v24) = objc_msgSend((id)v24, "isEqual:", objc_msgSend(v25, "objectClass"));

    if ((v24 & 1) == 0)
    {
      uint64_t v26 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:](v16, (uint64_t)v20, v26);
      }
      goto LABEL_9;
    }
  }
  if ([v18 compare:v19] == 1)
  {
    uint64_t v26 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_DKEvent initWithStream:source:startDate:endDate:value:confidence:metadata:]();
    }
LABEL_9:

    uint64_t v27 = 0;
    goto LABEL_10;
  }
  self = (_DKEvent *)[(_DKEvent *)self _initWithStream:v16 source:v17 startDate:v18 endDate:v19 value:v20 confidence:v21 metadata:a8];
  uint64_t v27 = self;
LABEL_10:

  return v27;
}

- (id)_initWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 value:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v29 = a3;
  id v17 = a4;
  id v28 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)_DKEvent;
  id v21 = [(_DKObject *)&v30 init];
  uint64_t v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_stream, a3);
    objc_storeStrong((id *)&v22->_startDate, a5);
    objc_storeStrong((id *)&v22->_endDate, a6);
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CAF0], "localTimeZone", v28, v29);
    uint64_t v24 = [v23 copy];
    timeZone = v22->_timeZone;
    v22->_timeZone = (NSTimeZone *)v24;

    objc_storeStrong((id *)&v22->_value, a7);
    objc_storeStrong((id *)&v22->_metadata, a9);
    v22->_confidence = a8;
    [(_DKObject *)v22 setSource:v17];
    uint64_t v26 = [MEMORY[0x1E4F29128] UUID];
    [(_DKObject *)v22 setUUID:v26];
  }
  return v22;
}

- (void)setEndDate:(id)a3
{
}

- (_DKEventStream)stream
{
  return (_DKEventStream *)objc_getProperty(self, a2, 64, 1);
}

+ (id)entityName
{
  return @"Event";
}

+ (_DKEvent)eventWithSearchableItem:(id)a3 bundleIdentifier:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"com.apple.mobilesafari"])
  {
    int v7 = +[_DKSource sourceForSearchableItem:v5 bundleID:v6];
    double v8 = [v5 attributeSet];
    id v9 = [v8 contentURL];
    int64_t v10 = [v9 absoluteString];

    if (v10)
    {
      id v11 = [v5 attributeSet];
      id v12 = [v11 title];

      if (v12)
      {
        id v13 = +[_DKSafariHistoryMetadataKey title];
        id v20 = v13;
        v21[0] = v12;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      }
      else
      {
        id v14 = 0;
      }
      id v16 = +[_DKSystemEventStreams safariHistoryStream];
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      id v18 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = +[_DKEvent eventWithStream:v16 source:v7 startDate:v17 endDate:v18 identifierStringValue:v10 metadata:v14];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return (_DKEvent *)v15;
}

+ (id)allowedWebpageURLSchemes
{
  if (allowedWebpageURLSchemes_once != -1) {
    dispatch_once(&allowedWebpageURLSchemes_once, &__block_literal_global_31);
  }
  id v2 = (void *)allowedWebpageURLSchemes_result;
  return v2;
}

+ (BOOL)isValidURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithURL:v5 resolvingAgainstBaseURL:1];

  if (v6
    && ([v6 scheme],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [v7 lowercaseString],
        double v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = (void *)[v8 copy],
        v8,
        v7,
        v9))
  {
    int64_t v10 = [a1 allowedWebpageURLSchemes];
    char v11 = [v10 containsObject:v9];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)eventRepresentingUserActivityWithSearchableItem:(id)a3 bundleIdentifier:(id)a4
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"com.apple.mobilesafari"])
  {
    double v8 = +[_DKSource sourceForSearchableItem:v6 bundleID:v7];
    id v9 = [v6 attributeSet];
    int64_t v10 = [v9 contentURL];

    if (!v10)
    {
      id v19 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (([a1 isValidURL:v10] & 1) == 0)
    {
      id v20 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        +[_DKEvent(CSSearchableItem) eventRepresentingUserActivityWithSearchableItem:bundleIdentifier:]((uint64_t)v10, v20);
      }

      id v19 = 0;
      goto LABEL_21;
    }
    char v11 = [v6 attributeSet];
    uint64_t v38 = [v11 title];

    id v12 = objc_alloc(MEMORY[0x1E4F22488]);
    id v13 = (void *)[v12 initWithActivityType:*MEMORY[0x1E4F28AC0]];
    [v13 setWebpageURL:v10];
    [v13 setTitle:v38];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__9;
    v46 = __Block_byref_object_dispose__9;
    id v47 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __95___DKEvent_CSSearchableItem__eventRepresentingUserActivityWithSearchableItem_bundleIdentifier___block_invoke;
    v39[3] = &unk_1E560E8E8;
    v41 = &v42;
    id v15 = v14;
    v40 = v15;
    [v13 _createUserActivityStringsWithOptions:0 completionHandler:v39];
    dispatch_time_t v16 = dispatch_time(0, 1000000000);
    intptr_t v17 = dispatch_semaphore_wait(v15, v16);
    if (v17)
    {
      id v18 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[_DKEvent(CSSearchableItem) eventRepresentingUserActivityWithSearchableItem:bundleIdentifier:](v18);
      }
      id v19 = 0;
    }
    else
    {
      if (!v43[5]
        || ([v6 uniqueIdentifier],
            id v21 = objc_claimAutoreleasedReturnValue(),
            BOOL v22 = v21 == 0,
            v21,
            v22))
      {
        id v19 = 0;
LABEL_20:

        _Block_object_dispose(&v42, 8);
        if (v17)
        {
LABEL_21:

          objc_super v30 = 0;
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      v35 = +[_DKApplicationActivityMetadataKey itemIdentifier];
      v48[0] = v35;
      v33 = [v6 uniqueIdentifier];
      v49[0] = v33;
      uint64_t v32 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
      v48[1] = v32;
      v49[1] = v43[5];
      uint64_t v23 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
      v48[2] = v23;
      v49[2] = MEMORY[0x1E4F1CC38];
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
      id v18 = [v24 mutableCopy];

      v25 = [v6 attributeSet];
      uint64_t v26 = [v25 contentDescription];

      if (v26)
      {
        id v36 = [v6 attributeSet];
        uint64_t v27 = [v36 contentDescription];
        id v28 = +[_DKApplicationActivityMetadataKey contentDescription];
        [v18 setObject:v27 forKeyedSubscript:v28];
      }
      v34 = +[_DKSystemEventStreams appActivityStream];
      uint64_t v37 = [MEMORY[0x1E4F1C9C8] date];
      id v29 = [MEMORY[0x1E4F1C9C8] date];
      id v19 = +[_DKEvent eventWithStream:v34 source:v8 startDate:v37 endDate:v29 identifierStringValue:v7 metadata:v18];
    }
    goto LABEL_20;
  }
  id v19 = 0;
LABEL_23:
  id v19 = v19;
  objc_super v30 = v19;
LABEL_24:

  return v30;
}

+ (_DKEvent)eventWithRelevantShortcut:(id)a3 bundleID:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v19 = 0;
    goto LABEL_30;
  }
  id v7 = INTrimToKeyImage();
  v47[1] = 0;
  double v8 = INExtractKeyImage();
  id v9 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = [v8 watchTemplate];
  uint64_t v42 = v10;
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [v8 watchTemplate];
    uint64_t v14 = [v13 image];
    if (!v14)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v15 = (void *)v14;
    dispatch_time_t v16 = [v9 keyImage];

    if (!v16)
    {
LABEL_11:
      v41 = v7;
      v47[0] = 0;
      BOOL v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:v47];
      id v23 = v47[0];
      uint64_t v24 = v23;
      if (v22)
      {
        id v38 = v23;
        v25 = +[_DKRelevantShortcutMetadataKey serializedRelevantShortcut];
        unint64_t v39 = v22;
        [v10 setObject:v22 forKeyedSubscript:v25];

        uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v27 = +[_DKSystemEventStreams appRelevantShortcutsStream];
        id v40 = v6;
        id v28 = +[_DKBundleIdentifier withBundle:v6];
        id v29 = (void *)[v10 copy];
        id v19 = +[_DKEvent eventWithStream:v27 startDate:v26 endDate:v26 value:v28 metadata:v29];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        objc_super v30 = [v5 relevanceProviders];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v44 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v36 = v35;
                if ([v36 situation] > 5)
                {
                  [v19 setCompatibilityVersion:4096];

                  goto LABEL_27;
                }
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v48 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
LABEL_27:

        id v6 = v40;
        uint64_t v24 = v38;
        BOOL v22 = v39;
      }
      else
      {
        uint64_t v26 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[_DKEvent(INRelevantShortcut) eventWithRelevantShortcut:bundleID:]();
        }
        id v19 = 0;
      }

      id v7 = v41;
      goto LABEL_29;
    }
  }
  intptr_t v17 = [v9 keyImage];
  id v12 = objc_msgSend(v17, "cd_encodedDataImage");

  id v18 = [v9 keyImage];

  if (!v18 || v12)
  {
    id v20 = [v9 proxyIdentifier];
    id v21 = +[_DKRelevantShortcutMetadataKey keyImageProxyIdentifier];
    [v10 setObject:v20 forKeyedSubscript:v21];

    id v13 = +[_DKRelevantShortcutMetadataKey serializedKeyImage];
    [v10 setObject:v12 forKeyedSubscript:v13];
    goto LABEL_10;
  }
  id v19 = 0;
LABEL_29:

LABEL_30:
  return (_DKEvent *)v19;
}

- (id)relevantShortcut
{
  v3 = [(_DKEvent *)self stream];
  id v4 = +[_DKSystemEventStreams appRelevantShortcutsStream];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = [(_DKEvent *)self metadata];
    id v7 = +[_DKRelevantShortcutMetadataKey serializedRelevantShortcut];
    double v8 = [v6 objectForKeyedSubscript:v7];

    if (!v8)
    {
      id v10 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DKEvent(INRelevantShortcut) relevantShortcut](v10);
      }
      id v21 = 0;
      goto LABEL_23;
    }
    id v25 = 0;
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v25];
    id v10 = v25;
    if (!v9)
    {
      id v9 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DKEvent(INRelevantShortcut) relevantShortcut]();
      }
      id v21 = 0;
      goto LABEL_22;
    }
    uint64_t v11 = [(_DKEvent *)self metadata];
    id v12 = +[_DKRelevantShortcutMetadataKey serializedKeyImage];
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      uint64_t v24 = v10;
      uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v24];
      id v15 = v24;

      if (!v14)
      {
        BOOL v22 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[_DKEvent(INRelevantShortcut) relevantShortcut]();
        }

        id v21 = 0;
        goto LABEL_21;
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F30528]);
      [v16 setKeyImage:v14];
      intptr_t v17 = [(_DKEvent *)self metadata];
      id v18 = +[_DKRelevantShortcutMetadataKey keyImageProxyIdentifier];
      id v19 = [v17 objectForKeyedSubscript:v18];
      [v16 setProxyIdentifier:v19];

      uint64_t v20 = INInsertKeyImageExtraction();

      id v9 = v20;
    }
    else
    {
      id v15 = v10;
    }
    id v9 = v9;
    id v21 = v9;
LABEL_21:

    id v10 = v15;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  double v8 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(_DKEvent(INRelevantShortcut) *)self relevantShortcut];
  }
  id v21 = 0;
LABEL_24:

  return v21;
}

- (id)toPBCodable
{
  return [(_DKEvent *)self toPBCodableUseStructuredMetadata:0];
}

+ (id)fromPBCodable:(id)a3
{
  return (id)[a1 fromPBCodable:a3 skipMetadata:0];
}

+ (id)fromPBCodable:(id)a3 skipMetadata:(BOOL)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v5;
    id v42 = v5;
    id v6 = -[_DKPREvent value]((uint64_t)v42);
    v41 = +[_DKObject fromPBCodable:v6];

    if (!a4
      && (-[_DKPREvent metadatas]((uint64_t)v42), (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (-[_DKPREvent metadatas]((uint64_t)v42),
          double v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          v7,
          v9))
    {
      id v10 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = -[_DKPREvent metadatas]((uint64_t)v42);
      long long v43 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v12 = -[_DKPREvent metadatas]((uint64_t)v42);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v45 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            intptr_t v17 = -[_DKPRMetadataEntry key](v16);
            if (-[_DKPRMetadataEntry hasIndex](v16))
            {
              id v18 = +[_DKMetadataPersistenceLookupTable indexToKey]();
              id v19 = [NSNumber numberWithUnsignedInt:-[_DKPRMetadataEntry index](v16)];
              uint64_t v20 = [v18 objectForKeyedSubscript:v19];

              intptr_t v17 = (void *)v20;
            }
            if (objc_msgSend(v17, "length", v40))
            {
              id v21 = (void *)MEMORY[0x1E4FBA8A8];
              BOOL v22 = -[_DKPRMetadataEntry value](v16);
              id v23 = [v21 fromPBCodable:v22];
              [v43 setObject:v23 forKeyedSubscript:v17];
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v13);
      }
    }
    else
    {
      long long v43 = 0;
    }
    id v25 = -[_DKPREvent stream]((uint64_t)v42);
    uint64_t v26 = +[_DKEventStream fromPBCodable:v25];

    uint64_t v27 = -[_DKPREvent source]((uint64_t)v42);
    id v28 = +[_DKSource fromPBCodable:v27];

    id v29 = objc_alloc(MEMORY[0x1E4F29128]);
    objc_super v30 = -[_DKPREvent identifier]((uint64_t)v42);
    uint64_t v31 = (void *)[v29 initWithUUIDString:v30];

    double v32 = 1.0;
    if (-[_DKPREvent hasConfidence]((uint64_t)v42)) {
      double v32 = -[_DKPREvent confidence]((uint64_t)v42);
    }
    uint64_t v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-[_DKPREvent startDate]((uint64_t)v42)];
    v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-[_DKPREvent endDate]((uint64_t)v42)];
    id v24 = [[_DKEvent alloc] _initWithStream:v26 source:v28 startDate:v33 endDate:v34 value:v41 confidence:v43 metadata:v32];
    [v24 setUUID:v31];
    v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-[_DKPREvent creationDate]((uint64_t)v42)];
    [v24 setCreationDate:v35];

    if (-[_DKPREvent hasTimeZone]((uint64_t)v42))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&fromPBCodable_skipMetadata___cacheLock);
      if (!fromPBCodable_skipMetadata___cachedTimeZone
        || (uint64_t v36 = fromPBCodable_skipMetadata___cachedSecondsSinceGMT, v36 != -[_DKPREvent timeZone]((uint64_t)v42)))
      {
        fromPBCodable_skipMetadata___cachedSecondsSinceGMT = -[_DKPREvent timeZone]((uint64_t)v42);
        uint64_t v37 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:-[_DKPREvent timeZone]((uint64_t)v42)];
        id v38 = (void *)fromPBCodable_skipMetadata___cachedTimeZone;
        fromPBCodable_skipMetadata___cachedTimeZone = v37;
      }
      objc_msgSend(v24, "setTimeZone:", fromPBCodable_skipMetadata___cachedTimeZone, v40);
      os_unfair_lock_unlock((os_unfair_lock_t)&fromPBCodable_skipMetadata___cacheLock);
    }
    if (-[_DKPREvent hasCompatibilityVersion]((uint64_t)v42)) {
      [v24 setCompatibilityVersion:-[_DKPREvent compatibilityVersion]((uint64_t)v42)];
    }

    id v5 = v40;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

+ (id)metadataForInteraction:(id)a3 storeKeyImage:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:12];
  double v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6];
  uint64_t v9 = +[_DKIntentMetadataKey serializedInteraction];
  [v7 setObject:v8 forKeyedSubscript:v9];

  id v10 = [v6 intent];
  uint64_t v11 = [v10 _className];
  id v12 = +[_DKIntentMetadataKey intentClass];
  [v7 setObject:v11 forKeyedSubscript:v12];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "_type"));
  uint64_t v14 = +[_DKIntentMetadataKey intentType];
  [v7 setObject:v13 forKeyedSubscript:v14];

  id v15 = [v10 verb];
  uint64_t v16 = +[_DKIntentMetadataKey intentVerb];
  [v7 setObject:v15 forKeyedSubscript:v16];

  intptr_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "_donatedBySiri"));
  id v18 = +[_DKIntentMetadataKey donatedBySiri];
  [v7 setObject:v17 forKeyedSubscript:v18];

  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "direction"));
  uint64_t v20 = +[_DKIntentMetadataKey direction];
  [v7 setObject:v19 forKeyedSubscript:v20];

  id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "intentHandlingStatus"));
  BOOL v22 = +[_DKIntentMetadataKey intentHandlingStatus];
  [v7 setObject:v21 forKeyedSubscript:v22];

  id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "shortcutAvailability"));
  id v24 = +[_DKIntentMetadataKey shortcutAvailability];
  [v7 setObject:v23 forKeyedSubscript:v24];

  id v25 = objc_msgSend(v10, "cd_derivedIntentIdentifier");
  uint64_t v26 = +[_DKIntentMetadataKey derivedIntentIdentifier];
  [v7 setObject:v25 forKeyedSubscript:v26];

  if (v4)
  {
    uint64_t v27 = [v10 _keyImage];
    id v28 = objc_msgSend(v27, "cd_encodedDataImage");
    id v29 = +[_DKIntentMetadataKey serializedKeyImage];
    [v7 setObject:v28 forKeyedSubscript:v29];
  }
  objc_super v30 = [v6 identifier];
  uint64_t v31 = +[_DKIntentMetadataKey interactionIdentifier];
  [v7 setObject:v30 forKeyedSubscript:v31];

  double v32 = [a1 relatedContactIdentifiersFromIntent:v10];
  uint64_t v33 = +[_DKIntentMetadataKey relatedContactIdentifiers];
  [v7 setObject:v32 forKeyedSubscript:v33];

  return v7;
}

+ (_DKEvent)eventWithInteraction:(id)a3 bundleIdentifier:(id)a4 storeKeyImage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 intent];
  uint64_t v11 = [a1 metadataForInteraction:v8 storeKeyImage:v5];
  id v12 = [v8 dateInterval];
  uint64_t v13 = [v12 startDate];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v16 = v15;

  intptr_t v17 = [v8 dateInterval];
  uint64_t v18 = [v17 endDate];
  id v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (void *)v18;
  }
  else {
    uint64_t v20 = v16;
  }
  id v21 = v20;

  BOOL v22 = +[_DKSource sourceForInteraction:v8 bundleID:v9];

  id v23 = [v10 domain];
  id v24 = +[_DKSystemEventStreams appIntentsStream];
  id v25 = +[_DKEvent eventWithStream:v24 source:v22 startDate:v16 endDate:v21 identifierStringValue:v23 metadata:v11];

  return (_DKEvent *)v25;
}

+ (id)relatedContactIdentifiersFromIntent:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v3 _nonNilParameters];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    unint64_t v8 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v9 = 0;
      uint64_t v23 = v6;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = objc_msgSend(v3, "valueForKey:", *(void *)(*((void *)&v29 + 1) + 8 * v9), v23);
        objc_opt_class();
        uint64_t isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          uint64_t v12 = v7;
          unint64_t v13 = v8;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v14 = v10;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v26;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v14);
                }
                __63___DKEvent_INInteraction__relatedContactIdentifiersFromIntent___block_invoke(v15, v4, *(void **)(*((void *)&v25 + 1) + 8 * v18++));
              }
              while (v16 != v18);
              uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              uint64_t v16 = v15;
            }
            while (v15);
          }

          unint64_t v8 = v13;
          uint64_t v7 = v12;
          uint64_t v6 = v23;
        }
        else
        {
          __63___DKEvent_INInteraction__relatedContactIdentifiersFromIntent___block_invoke(isKindOfClass, v4, v10);
        }

        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
  id v19 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    +[_DKEvent(INInteraction) relatedContactIdentifiersFromIntent:]();
  }

  if ([v4 count])
  {
    uint64_t v20 = [v4 allObjects];
    id v21 = [v20 componentsJoinedByString:@","];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)interaction
{
  id v3 = [(_DKEvent *)self stream];
  BOOL v4 = [v3 name];
  uint64_t v5 = +[_DKSystemEventStreams appIntentsStream];
  uint64_t v6 = [v5 name];
  char v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    unint64_t v8 = [(_DKEvent *)self metadata];
    uint64_t v9 = +[_DKIntentMetadataKey serializedInteraction];
    id v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v23 = 0;
      uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v23];
      uint64_t v12 = v23;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v21 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[_DKEvent(INInteraction) interaction]();
        }
      }
    }
    else
    {
      uint64_t v12 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(_DKEvent(INInteraction) *)v12 interaction];
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    id v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(_DKEvent(INInteraction) *)self interaction];
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)fetchInteractionWithPopulatedKeyImage:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  if (v4)
  {
    uint64_t v5 = [(_DKEvent *)self interaction];
    uint64_t v6 = [v5 intent];
    char v7 = [v6 _keyImage];
    if (v7)
    {
      unint64_t v8 = [(_DKObject *)self source];
      uint64_t v9 = [v8 deviceID];

      if (v9)
      {
        id v10 = [(_DKEvent *)self metadata];
        uint64_t v11 = +[_DKIntentMetadataKey serializedKeyImage];
        id v12 = [v10 objectForKeyedSubscript:v11];

        if (v12)
        {
          id v31 = 0;
          id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v31];
          id v14 = v31;
          uint64_t v15 = v14;
          if (!v13)
          {
            id v24 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[_DKEvent(INInteraction) fetchInteractionWithPopulatedKeyImage:]();
            }

            v4[2](v4, 0);
            goto LABEL_17;
          }

LABEL_9:
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke;
          v28[3] = &unk_1E560F0C8;
          id v29 = v7;
          id v30 = v13;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2;
          v25[3] = &unk_1E560F0F0;
          id v26 = v30;
          long long v27 = v4;
          id v12 = v30;
          [v5 _injectProxiesForImages:v28 completion:v25];

LABEL_17:
          goto LABEL_18;
        }
        uint64_t v16 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[_DKEvent(INInteraction) fetchInteractionWithPopulatedKeyImage:](v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }
      else
      {
        id v13 = objc_msgSend(v7, "cd_dataImage");
        if (v13) {
          goto LABEL_9;
        }
      }
      v4[2](v4, 0);
    }
    else
    {
      ((void (**)(id, void *))v4)[2](v4, v5);
    }
LABEL_18:
  }
}

- (id)metadataFromStructuredMetadata:(id)a3 excludedMetadataKeys:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = +[_DKMetadataPersistenceLookupTable attributeToKey]();
  unint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    id v31 = v8;
    id v32 = v5;
    uint64_t v30 = *(void *)v42;
    id v38 = v6;
    do
    {
      uint64_t v13 = 0;
      uint64_t v39 = v11;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(NSString **)(*((void *)&v41 + 1) + 8 * v13);
        uint64_t v15 = [v9 objectForKeyedSubscript:v14];
        uint64_t v16 = (void *)v15;
        if (!v6 || !v15 || ([v6 containsObject:v15] & 1) == 0)
        {
          NSSelectorFromString(v14);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v17 = [v5 valueForKey:v14];
            if (v17)
            {
              uint64_t v18 = (void *)v17;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v37 = objc_opt_class();
                uint64_t v36 = objc_opt_class();
                uint64_t v35 = objc_opt_class();
                uint64_t v34 = objc_opt_class();
                uint64_t v33 = objc_opt_class();
                uint64_t v20 = objc_opt_class();
                uint64_t v21 = objc_opt_class();
                uint64_t v22 = objc_opt_class();
                uint64_t v23 = objc_opt_class();
                id v24 = objc_msgSend(v19, "setWithObjects:", v37, v36, v35, v34, v33, v20, v21, v22, v23, objc_opt_class(), 0);
                id v40 = 0;
                uint64_t v25 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v24 fromData:v18 error:&v40];
                id v26 = v40;

                id v6 = v38;
                if (v26)
                {
                  long long v27 = +[_CDLogging knowledgeChannel];
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v46 = v26;
                    _os_log_error_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_ERROR, "Error unarchiving object %@", buf, 0xCu);
                  }
                }
                uint64_t v18 = (void *)v25;
                unint64_t v8 = v31;
                id v5 = v32;
                uint64_t v12 = v30;
              }
              else
              {
                id v6 = v38;
              }
              long long v28 = [v9 objectForKeyedSubscript:v14];
              [v8 setObject:v18 forKeyedSubscript:v28];

              uint64_t v11 = v39;
            }
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)metadataFromStructuredMetadata:(id)a3 excludedMetadataKeys:(id)a4 cache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (id *)a5;
  if (v10)
  {
    uint64_t v11 = [v8 objectID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84___DKEvent_MOConversion__metadataFromStructuredMetadata_excludedMetadataKeys_cache___block_invoke;
    v14[3] = &unk_1E5610308;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    uint64_t v12 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v10, v11, @"metadata", v14);
  }
  else
  {
    uint64_t v12 = [(_DKEvent *)self metadataFromStructuredMetadata:v8 excludedMetadataKeys:v9];
  }

  return v12;
}

- (id)metadataFromCustomMetadata:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        uint64_t v11 = [v10 name];
        if (!v11)
        {
          [NSString stringWithFormat:@"Missing attribute for CustomMetadata: %@", v10, v29];
          id v14 = LABEL_10:;
          +[_CDErrorUtilities simulateCrashWithDescription:v14];
          goto LABEL_18;
        }
        uint64_t v12 = [v10 stringValue];

        if (v12)
        {
          uint64_t v13 = [v10 stringValue];
LABEL_17:
          id v14 = (void *)v13;
          [v4 setObject:v13 forKeyedSubscript:v11];
          goto LABEL_18;
        }
        id v15 = [v10 integerValue];

        if (v15)
        {
          uint64_t v13 = [v10 integerValue];
          goto LABEL_17;
        }
        id v16 = [v10 doubleValue];

        if (v16)
        {
          uint64_t v13 = [v10 doubleValue];
          goto LABEL_17;
        }
        uint64_t v17 = [v10 dateValue];

        if (v17)
        {
          uint64_t v13 = [v10 dateValue];
          goto LABEL_17;
        }
        uint64_t v18 = [v10 binaryValue];

        if (!v18)
        {
          [NSString stringWithFormat:@"Invalid attributeValue for key '%@': %@", v11, v10];
          goto LABEL_10;
        }
        uint64_t v19 = [v10 valueHash];
        int v20 = [v19 hasSuffix:@"B"];

        if (v20)
        {
          id v14 = [v10 binaryValue];
          [v4 setObject:v14 forKeyedSubscript:v11];
        }
        else
        {
          uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v36 = objc_opt_class();
          uint64_t v35 = objc_opt_class();
          uint64_t v34 = objc_opt_class();
          uint64_t v33 = objc_opt_class();
          uint64_t v32 = objc_opt_class();
          uint64_t v31 = objc_opt_class();
          uint64_t v30 = objc_opt_class();
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = objc_opt_class();
          id v14 = objc_msgSend(v37, "setWithObjects:", v36, v35, v34, v33, v32, v31, v30, v21, v22, objc_opt_class(), 0);
          uint64_t v23 = (void *)MEMORY[0x1E4F28DC0];
          id v24 = [v10 binaryValue];
          id v39 = 0;
          uint64_t v38 = [v23 unarchivedObjectOfClasses:v14 fromData:v24 error:&v39];
          id v25 = v39;

          if (v25)
          {
            id v26 = (void *)v38;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              [(_DKEvent(MOConversion) *)buf metadataFromCustomMetadata:&v45];
            }
          }
          else
          {
            id v26 = (void *)v38;
            [v4 setObject:v38 forKeyedSubscript:v11];
          }
        }
LABEL_18:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v27 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
      uint64_t v7 = v27;
    }
    while (v27);
  }

  return v4;
}

- (id)metadataFromCustomMetadata:(id)a3 cache:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (id *)a4;
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectID];
          id v15 = [v14 URIRepresentation];

          id v16 = [v15 absoluteString];
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    [v8 sortUsingSelector:sel_compare_];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59___DKEvent_MOConversion__metadataFromCustomMetadata_cache___block_invoke;
    v19[3] = &unk_1E5610330;
    v19[4] = self;
    id v20 = v9;
    uint64_t v17 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v7, v8, @"attributeValue", v19);
  }
  else
  {
    uint64_t v17 = [(_DKEvent *)self metadataFromCustomMetadata:v6];
  }

  return v17;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (id *)a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    id v14 = [v13 streamName];

    if (v14)
    {
      id v15 = [v13 streamName];
      id v16 = [a1 eventValueFromManagedObject:v13 streamName:v15 readMetadata:v8 excludedMetadataKeys:v11 cache:v12];

      if (v16)
      {
        uint64_t v17 = [a1 eventStreamFromManagedObject:v13 forValue:v16 cache:v12];
        if (v17)
        {
          if (v12)
          {
            uint64_t v18 = NSNumber;
            [v13 startDate];
            uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke;
            v60[3] = &unk_1E56102B8;
            id v20 = v13;
            id v61 = v20;
            uint64_t v21 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v12, v19, @"date", v60);

            long long v22 = NSNumber;
            [v20 endDate];
            long long v23 = objc_msgSend(v22, "numberWithDouble:");
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_2;
            v58[3] = &unk_1E56102B8;
            id v59 = v20;
            long long v24 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v12, v23, @"date", v58);
          }
          else
          {
            uint64_t v26 = (void *)MEMORY[0x1E4F1C9C8];
            [v13 startDate];
            uint64_t v21 = objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
            uint64_t v27 = (void *)MEMORY[0x1E4F1C9C8];
            [v13 endDate];
            long long v24 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
          }
          long long v53 = (void *)v21;
          long long v54 = v17;
          long long v28 = +[_DKEvent eventWithStream:v17 startDate:v21 endDate:v24 value:v16];
          [v13 confidence];
          objc_msgSend(v28, "setConfidence:");
          if (v12)
          {
            uint64_t v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "secondsFromGMT"));
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_3;
            v56[3] = &unk_1E56102B8;
            id v57 = v13;
            -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v12, v29, @"timeZone", v56);
            v31 = uint64_t v30 = v24;
            [v28 setTimeZone:v31];

            long long v24 = v30;
            uint64_t v32 = v57;
          }
          else
          {
            uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", objc_msgSend(v13, "secondsFromGMT"));
            [v28 setTimeZone:v32];
          }

          if ([v28 copyBaseObjectInfoFromManagedObject:v13 cache:v12])
          {
            if (v8)
            {
              uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
              if ([v13 hasCustomMetadata])
              {
                if ([v11 count])
                {
                  long long v52 = v24;
                  uint64_t v34 = +[_DKCustomMetadataMO fetchRequest];
                  uint64_t v35 = (void *)MEMORY[0x1E4F28F60];
                  uint64_t v36 = [v13 objectID];
                  uint64_t v37 = [v35 predicateWithFormat:@"ANY event == %@ && NOT name IN %@", v36, v11];
                  [v34 setPredicate:v37];

                  uint64_t v38 = [v13 managedObjectContext];
                  id v55 = 0;
                  long long v51 = v34;
                  uint64_t v39 = [v38 executeFetchRequest:v34 error:&v55];
                  id v40 = v55;

                  if (v40)
                  {
                    long long v41 = +[_CDLogging knowledgeChannel];
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                      +[_DKEvent(MOConversion) objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:](v54, v41);
                    }
                  }
                  long long v42 = (void *)v39;
                  long long v43 = v51;
                  long long v24 = v52;
                }
                else
                {
                  long long v43 = [v13 customMetadata];
                  long long v42 = [v43 allObjects];
                }

                long long v44 = [v28 metadataFromCustomMetadata:v42 cache:v12];
                [v33 addEntriesFromDictionary:v44];
              }
              if ([v13 hasStructuredMetadata])
              {
                uint64_t v45 = [v13 structuredMetadata];

                if (v45)
                {
                  id v46 = [v13 structuredMetadata];
                  [v28 metadataFromStructuredMetadata:v46 excludedMetadataKeys:v11 cache:v12];
                  v48 = uint64_t v47 = v24;
                  [v33 addEntriesFromDictionary:v48];

                  long long v24 = v47;
                }
              }
              if ([v33 count])
              {
                if (v11 && [v11 count]) {
                  [v33 removeObjectsForKeys:v11];
                }
                uint64_t v49 = (void *)[v33 copy];
                [v28 setMetadata:v49];
              }
            }
            objc_msgSend(v28, "setShouldSync:", objc_msgSend(v13, "shouldSync"));
            objc_msgSend(v28, "setCompatibilityVersion:", objc_msgSend(v13, "compatibilityVersion"));
            id v25 = v28;
          }
          else
          {
            id v25 = 0;
          }

          uint64_t v17 = v54;
        }
        else
        {
          id v25 = 0;
        }
      }
      else
      {
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (id)eventStreamFromManagedObject:(id)a3 forValue:(id)a4 cache:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_1EDE26430])
  {
    BOOL v8 = [v7 objectType];
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = [v6 streamName];
  id v10 = +[_DKEventStream eventStreamWithName:v9 valueType:v8];

  return v10;
}

+ (id)uncachedEventValueFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (id *)a6;
  switch([v9 valueClass])
  {
    case 0u:
      uint64_t v12 = [v9 value];
      uint64_t v13 = +[_DKObject objectFromManagedObject:v12 readMetadata:v8 excludedMetadataKeys:v10 cache:v11];
      goto LABEL_9;
    case 1u:
      uint64_t v12 = [v9 valueString];
      if (v11)
      {
        uint64_t v15 = -[_DKObjectFromMOCache deduplicateString:](v11, v12);

        uint64_t v12 = (void *)v15;
      }
      id v16 = +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", [v9 valueTypeCode]);
      id v14 = +[_DKIdentifier identifierWithString:v12 type:v16];

      goto LABEL_10;
    case 2u:
      uint64_t v12 = +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", [v9 valueTypeCode]);
      uint64_t v13 = +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", [v9 valueInteger], v12);
      goto LABEL_9;
    case 3u:
      uint64_t v12 = +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", [v9 valueTypeCode]);
      [v9 valueDouble];
      uint64_t v13 = +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v12);
LABEL_9:
      id v14 = (void *)v13;
LABEL_10:

      break;
    default:
      id v14 = 0;
      break;
  }

  return v14;
}

+ (id)eventValueFromManagedObject:(id)a3 streamName:(id)a4 readMetadata:(BOOL)a5 excludedMetadataKeys:(id)a6 cache:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v15 && [v12 valueClass] != 3)
  {
    if ([v12 valueClass] == 1) {
      [v12 valueString];
    }
    else {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "valueInteger"));
    }
    uint64_t v18 = [NSString stringWithFormat:@"%@.%@", v13, v17];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105___DKEvent_MOConversion__eventValueFromManagedObject_streamName_readMetadata_excludedMetadataKeys_cache___block_invoke;
    v20[3] = &unk_1E5610358;
    id v24 = a1;
    id v21 = v12;
    BOOL v25 = v9;
    id v22 = v14;
    long long v23 = (id *)v15;
    id v16 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v23, v18, @"eventValue", v20);
  }
  else
  {
    id v16 = [a1 uncachedEventValueFromManagedObject:v12 readMetadata:v9 excludedMetadataKeys:v14 cache:v15];
  }

  return v16;
}

- (unint64_t)eventValueClassOf:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 UUID];

  if (v4)
  {
    unint64_t v5 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v5 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v5 = 3;
        }
        else {
          unint64_t v5 = 0;
        }
      }
    }
  }

  return v5;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v36.receiver = self,
        v36.super_class = (Class)_DKEvent,
        [(_DKObject *)&v36 copyToManagedObject:v4]))
  {
    id v5 = v4;
    id v6 = [(_DKEvent *)self stream];
    id v7 = [v6 name];
    [v5 setStreamName:v7];

    BOOL v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    BOOL v9 = [(_DKEvent *)self timeZone];
    objc_msgSend(v5, "setSecondsFromGMT:", objc_msgSend(v9, "secondsFromGMT"));

    id v10 = [(_DKEvent *)self startDate];
    [v10 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setStartDate:");

    [v5 startDate];
    [v5 setStartSecondOfDay:((int)(uint64_t)v11 % 86400)];
    id v12 = [(_DKEvent *)self startDate];
    id v13 = [v8 components:512 fromDate:v12];
    objc_msgSend(v5, "setStartDayOfWeek:", (__int16)objc_msgSend(v13, "weekday"));

    id v14 = [(_DKEvent *)self endDate];
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setEndDate:");

    [v5 endDate];
    [v5 setEndSecondOfDay:((int)(uint64_t)v15 % 86400)];
    id v16 = [(_DKEvent *)self endDate];
    uint64_t v17 = [v8 components:512 fromDate:v16];
    objc_msgSend(v5, "setEndDayOfWeek:", (__int16)objc_msgSend((id)v17, "weekday"));

    objc_msgSend(v5, "setShouldSync:", -[_DKEvent shouldSync](self, "shouldSync"));
    [(_DKEvent *)self confidence];
    objc_msgSend(v5, "setConfidence:");
    objc_msgSend(v5, "setCompatibilityVersion:", -[_DKEvent compatibilityVersion](self, "compatibilityVersion"));
    uint64_t v18 = [(_DKEvent *)self value];
    objc_msgSend(v5, "setValueInteger:", objc_msgSend(v18, "integerValue"));

    uint64_t v19 = [(_DKEvent *)self value];
    [v19 doubleValue];
    objc_msgSend(v5, "setValueDouble:");

    id v20 = [(_DKEvent *)self value];
    objc_opt_class();
    LOBYTE(v17) = objc_opt_isKindOfClass();

    if (v17)
    {
      id v21 = [(_DKEvent *)self value];
      id v22 = [v21 stringValue];
      [v5 setValueString:v22];
    }
    long long v23 = objc_opt_class();
    id v24 = [(_DKEvent *)self metadata];
    [v23 copyMetadata:v24 toManagedObject:v5];

    BOOL v25 = [(_DKEvent *)self value];
    unint64_t v26 = [(_DKEvent *)self eventValueClassOf:v25];

    [v5 setValueClass:(__int16)v26];
    if (v26)
    {
      uint64_t v27 = [(_DKEvent *)self value];
      objc_msgSend(v5, "setValueTypeCode:", objc_msgSend(v27, "typeCode"));
      char v28 = 1;
    }
    else
    {
      [v5 setValueClass:0];
      uint64_t v29 = (void *)MEMORY[0x1E4F1C0A8];
      uint64_t v30 = [(_DKEvent *)self value];
      uint64_t v31 = [(id)objc_opt_class() entityName];
      uint64_t v32 = [v5 managedObjectContext];
      uint64_t v33 = [v29 insertNewObjectForEntityForName:v31 inManagedObjectContext:v32];
      [v5 setValue:v33];

      uint64_t v27 = [(_DKEvent *)self value];
      uint64_t v34 = [v5 value];
      char v28 = [v27 copyToManagedObject:v34];
    }
  }
  else
  {
    char v28 = 0;
  }

  return v28;
}

+ (id)fetchCustomMetadataWithName:(id)a3 valueHash:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__21;
  uint64_t v30 = __Block_byref_object_dispose__21;
  id v31 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke;
  id v21 = &unk_1E560E058;
  id v10 = v9;
  id v22 = v10;
  id v11 = v7;
  id v23 = v11;
  id v12 = v8;
  id v24 = v12;
  BOOL v25 = &v26;
  [v10 performWithOptions:4 andBlock:&v18];
  id v13 = (void *)v27[5];
  if (!v13)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C0A8], "insertNewObjectForEntityForName:inManagedObjectContext:", @"CustomMetadata", v10, v18, v19, v20, v21, v22, v23);
    double v15 = (void *)v27[5];
    v27[5] = v14;

    [(id)v27[5] setName:v11];
    [(id)v27[5] setValueHash:v12];
    id v13 = (void *)v27[5];
  }
  id v16 = v13;

  _Block_object_dispose(&v26, 8);
  return v16;
}

+ (BOOL)copyMetadata:(id)a3 toManagedObject:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v5 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_46;
  }
  id v46 = v5;
  id v6 = v5;
  long long v51 = +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  uint64_t v49 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = [v52 allKeys];
  id obj = [v7 sortedArrayUsingSelector:sel_compare_];

  uint64_t v53 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (!v53)
  {
    id v8 = 0;
    goto LABEL_44;
  }
  id v8 = 0;
  uint64_t v50 = *(void *)v58;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v58 != v50) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v57 + 1) + 8 * v9);
      id v11 = [v52 objectForKeyedSubscript:v10];
      id v12 = [v51 objectForKeyedSubscript:v10];
      if (!v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = NSString;
          id v22 = v11;
          id v23 = +[_CDHashUtilities md5ForString:v22];
          id v24 = [v21 stringWithFormat:@"%@S", v23];

          BOOL v25 = [v6 managedObjectContext];
          uint64_t v26 = +[_DKEvent fetchCustomMetadataWithName:v10 valueHash:v24 context:v25];

          [v26 setStringValue:v22];
LABEL_25:

          [v6 addCustomMetadataObject:v26];
          [v6 setHasCustomMetadata:1];
          if (([v10 hasPrefix:@"test"] & 1) == 0)
          {
            uint64_t v38 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = [v6 streamName];
              id v40 = (objc_class *)objc_opt_class();
              long long v41 = NSStringFromClass(v40);
              *(_DWORD *)buf = 138412802;
              v62 = v39;
              __int16 v63 = 2112;
              v64 = v10;
              __int16 v65 = 2112;
              v66 = v41;
              _os_log_impl(&dword_18ECEB000, v38, OS_LOG_TYPE_DEFAULT, "Using custom metadata path in stream %@ for key '%@'. Value class: %@", buf, 0x20u);
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v11;
            if (CFNumberIsFloatType((CFNumberRef)v22))
            {
              id v24 = [NSString stringWithFormat:@"%@D", v22];
              uint64_t v27 = [v6 managedObjectContext];
              uint64_t v26 = +[_DKEvent fetchCustomMetadataWithName:v10 valueHash:v24 context:v27];

              [v26 setDoubleValue:v22];
            }
            else
            {
              id v24 = [NSString stringWithFormat:@"%@I", v22];
              uint64_t v34 = [v6 managedObjectContext];
              uint64_t v26 = +[_DKEvent fetchCustomMetadataWithName:v10 valueHash:v24 context:v34];

              [v26 setIntegerValue:v22];
            }
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v28 = NSString;
            id v22 = v11;
            [v22 timeIntervalSinceReferenceDate];
            id v24 = objc_msgSend(v28, "stringWithFormat:", @"%fT", v29);
            uint64_t v30 = [v6 managedObjectContext];
            uint64_t v26 = +[_DKEvent fetchCustomMetadataWithName:v10 valueHash:v24 context:v30];

            [v26 setDateValue:v22];
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = NSString;
            id v22 = v11;
            uint64_t v32 = +[_CDHashUtilities md5ForData:v22];
            id v24 = [v31 stringWithFormat:@"%@B", v32];

            uint64_t v33 = [v6 managedObjectContext];
            uint64_t v26 = +[_DKEvent fetchCustomMetadataWithName:v10 valueHash:v24 context:v33];

            [v26 setBinaryValue:v22];
            goto LABEL_25;
          }
          if ([v11 conformsToProtocol:&unk_1EDE1F850])
          {
            id v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11];
            uint64_t v35 = NSString;
            objc_super v36 = +[_CDHashUtilities md5ForData:v24];
            id v22 = [v35 stringWithFormat:@"%@O", v36];

            uint64_t v37 = [v6 managedObjectContext];
            uint64_t v26 = +[_DKEvent fetchCustomMetadataWithName:v10 valueHash:v22 context:v37];

            [v26 setBinaryValue:v24];
            goto LABEL_25;
          }
          uint64_t v26 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[_DKEvent(MOConversion) copyMetadata:toManagedObject:](&v55, v56, v26);
          }
        }

        goto LABEL_30;
      }
      if (!v8)
      {
        id v13 = [_DKStructuredMetadataMO alloc];
        uint64_t v14 = +[_DKStructuredMetadataMO entity];
        double v15 = [v6 managedObjectContext];
        id v8 = [(_DKStructuredMetadataMO *)v13 initWithEntity:v14 insertIntoManagedObjectContext:v15];
      }
      id v16 = [(_DKStructuredMetadataMO *)v8 entity];
      uint64_t v17 = [v16 propertiesByName];
      uint64_t v18 = [v17 objectForKeyedSubscript:v12];
      BOOL v19 = [v18 attributeType] == 1000;

      if (v19)
      {
        uint64_t v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11];

        id v11 = (void *)v20;
      }
      [(_DKStructuredMetadataMO *)v8 setValue:v11 forKey:v12];
      [v49 setObject:v11 forKeyedSubscript:v10];
LABEL_30:

      ++v9;
    }
    while (v53 != v9);
    uint64_t v42 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    uint64_t v53 = v42;
  }
  while (v42);

  if (v8)
  {
    id v54 = 0;
    long long v43 = +[_CDHashUtilities md5forDictionary:v49 error:&v54];
    id obj = v54;
    if (v43)
    {
      [(_DKStructuredMetadataMO *)v8 setMetadataHash:v43];
      [(_DKStructuredMetadataMO *)v8 addEventObject:v6];
      [v6 setHasStructuredMetadata:1];
    }
    else
    {
      long long v44 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        +[_DKEvent(MOConversion) copyMetadata:toManagedObject:]();
      }
    }
LABEL_44:
  }
  id v5 = v46;
LABEL_46:

  return isKindOfClass & 1;
}

+ (id)moKeyPathForKeyPath:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [v2 componentsSeparatedByString:@"."];
  id v4 = [v3 firstObject];
  int v5 = [v4 isEqualToString:@"metadata"];

  if (v5)
  {
    id v6 = +[_DKMetadataPersistenceLookupTable keyToAttribute]();
    id v7 = [v3 lastObject];
    id v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      id v9 = [NSString stringWithFormat:@"structuredMetadata.%@", v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v10 = [v3 firstObject];
    int v11 = [v10 isEqualToString:@"value"];

    if (v11)
    {
      id v12 = [v3 lastObject];
      id v13 = [v12 stringByReplacingOccurrencesOfString:@"Value" withString:&stru_1EDDE58B8];

      uint64_t v14 = [v13 substringToIndex:1];
      double v15 = [v14 capitalizedString];
      id v16 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, 1, v15);

      id v9 = [NSString stringWithFormat:@"value%@", v16];
    }
    else
    {
      id v9 = v2;
    }
  }

  return v9;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 value:(id)a6 confidence:(double)a7 metadata:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [[_DKEvent alloc] initWithStream:v17 source:0 startDate:v16 endDate:v15 value:v14 confidence:v13 metadata:a7];

  return v18;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 categoryIntegerValue:(int64_t)a7 metadata:(id)a8
{
  return (_DKEvent *)[a1 eventWithStream:a3 source:a4 startDate:a5 endDate:a6 categoryIntegerValue:a7 confidence:a8 metadata:1.0];
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 categoryIntegerValue:(int64_t)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v20 = +[_DKAnyIntegerCategory type];
  id v21 = [v15 eventValueType];

  if (!v21) {
    goto LABEL_4;
  }
  id v22 = [v15 eventValueType];
  int v23 = objc_msgSend((id)objc_msgSend(v22, "objectClass"), "isEqual:", objc_opt_class());

  if (v23)
  {
    id v24 = [v15 eventValueType];
    uint64_t v25 = +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", [v24 typeCode]);

    uint64_t v20 = (void *)v25;
LABEL_4:
    uint64_t v26 = +[_DKCategory categoryWithInteger:a7 type:v20];
    uint64_t v27 = [[_DKEvent alloc] initWithStream:v15 source:v16 startDate:v17 endDate:v18 value:v26 confidence:v19 metadata:a8];

    goto LABEL_8;
  }
  uint64_t v28 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    +[_DKEvent eventWithStream:source:startDate:endDate:categoryIntegerValue:confidence:metadata:](v15);
  }

  uint64_t v27 = 0;
LABEL_8:

  return v27;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 quantityDoubleValue:(double)a7 metadata:(id)a8
{
  return (_DKEvent *)[a1 eventWithStream:a3 source:a4 startDate:a5 endDate:a6 quantityDoubleValue:a8 confidence:a7 metadata:1.0];
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 quantityDoubleValue:(double)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v20 = +[_DKAnyDoubleQuantity type];
  id v21 = [v15 eventValueType];

  if (!v21) {
    goto LABEL_4;
  }
  id v22 = [v15 eventValueType];
  int v23 = objc_msgSend((id)objc_msgSend(v22, "objectClass"), "isEqual:", objc_opt_class());

  if (v23)
  {
    id v24 = [v15 eventValueType];
    uint64_t v25 = +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", [v24 typeCode]);

    uint64_t v20 = (void *)v25;
LABEL_4:
    uint64_t v26 = +[_DKQuantity quantityWithDouble:v20 type:a7];
    uint64_t v27 = [[_DKEvent alloc] initWithStream:v15 source:v16 startDate:v17 endDate:v18 value:v26 confidence:v19 metadata:a8];

    goto LABEL_8;
  }
  uint64_t v28 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    +[_DKEvent eventWithStream:source:startDate:endDate:quantityDoubleValue:confidence:metadata:](v15);
  }

  uint64_t v27 = 0;
LABEL_8:

  return v27;
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 identifierStringValue:(id)a7 metadata:(id)a8
{
  return (_DKEvent *)[a1 eventWithStream:a3 source:a4 startDate:a5 endDate:a6 identifierStringValue:a7 confidence:a8 metadata:1.0];
}

+ (_DKEvent)eventWithStream:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 identifierStringValue:(id)a7 confidence:(double)a8 metadata:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = +[_DKAnyStringIdentifier type];
  id v22 = [v15 eventValueType];

  if (!v22) {
    goto LABEL_4;
  }
  int v23 = [v15 eventValueType];
  int v24 = objc_msgSend((id)objc_msgSend(v23, "objectClass"), "isEqual:", objc_opt_class());

  if (v24)
  {
    uint64_t v25 = [v15 eventValueType];
    uint64_t v26 = +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", [v25 typeCode]);

    id v21 = (void *)v26;
LABEL_4:
    uint64_t v27 = +[_DKIdentifier identifierWithString:v19 type:v21];
    uint64_t v28 = [[_DKEvent alloc] initWithStream:v15 source:v16 startDate:v17 endDate:v18 value:v27 confidence:v20 metadata:a8];

    goto LABEL_8;
  }
  uint64_t v29 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:confidence:metadata:](v15);
  }

  uint64_t v28 = 0;
LABEL_8:

  return v28;
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 categoryIntegerValue:(int64_t)a6 metadata:(id)a7
{
  return (_DKEvent *)[a1 eventWithStream:a3 source:0 startDate:a4 endDate:a5 categoryIntegerValue:a6 confidence:a7 metadata:1.0];
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 quantityDoubleValue:(double)a6 metadata:(id)a7
{
  return (_DKEvent *)[a1 eventWithStream:a3 source:0 startDate:a4 endDate:a5 quantityDoubleValue:a7 confidence:a6 metadata:1.0];
}

+ (_DKEvent)eventWithStream:(id)a3 startDate:(id)a4 endDate:(id)a5 identifierStringValue:(id)a6 metadata:(id)a7
{
  return (_DKEvent *)[a1 eventWithStream:a3 source:0 startDate:a4 endDate:a5 identifierStringValue:a6 confidence:a7 metadata:1.0];
}

- (_DKEvent)initWithCoder:(id)a3
{
  v25[10] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_DKEvent;
  int v5 = [(_DKObject *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stream"];
    stream = v5->_stream;
    v5->_stream = (_DKEventStream *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v14;
    v5->_shouldSync = [v4 decodeBoolForKey:@"shouldSync"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (_DKObject *)v15;

    v5->_compatibilityVersion = [v4 decodeInt64ForKey:@"compatibilityVersion"];
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v4, "dk_shouldSkipDecodingMetadata") & 1) == 0)
    {
      id v17 = (void *)MEMORY[0x1E4F1CAD0];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      v25[3] = objc_opt_class();
      void v25[4] = objc_opt_class();
      v25[5] = objc_opt_class();
      v25[6] = objc_opt_class();
      v25[7] = objc_opt_class();
      v25[8] = objc_opt_class();
      v25[9] = objc_opt_class();
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:10];
      id v19 = [v17 setWithArray:v18];

      uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"metadata"];
      metadata = v5->_metadata;
      v5->_metadata = (NSDictionary *)v20;
    }
    id v22 = v5;
  }

  return v5;
}

- (NSString)description
{
  metadata = self->_metadata;
  id v4 = [(NSDictionary *)metadata allKeys];
  int v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_67);
  uint64_t v6 = [(NSDictionary *)metadata dictionaryWithValuesForKeys:v5];

  uint64_t v20 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  stream = self->_stream;
  startDate = self->_startDate;
  endDate = self->_endDate;
  NSInteger v12 = [(NSTimeZone *)self->_timeZone secondsFromGMT];
  double confidence = self->_confidence;
  value = self->_value;
  uint64_t v15 = [NSNumber numberWithBool:self->_shouldSync];
  id v16 = [NSNumber numberWithLongLong:self->_compatibilityVersion];
  v21.receiver = self;
  v21.super_class = (Class)_DKEvent;
  id v17 = [(_DKObject *)&v21 description];
  id v18 = [v20 stringWithFormat:@"%@: { stream='%@', start=%@, end=%@, tz=%d, conf=%f, value=%@, metadata=%@, shouldSync=%@, compatibilityVersion=%@, %@}", v8, stream, startDate, endDate, v12, *(void *)&confidence, value, v6, v15, v16, v17];

  return (NSString *)v18;
}

- (id)primaryValue
{
  id v3 = [(_DKEvent *)self value];
  int v4 = [v3 conformsToProtocol:&unk_1EDE263C0];

  if (v4)
  {
    int v5 = [(_DKEvent *)self value];
    uint64_t v6 = [v5 primaryValue];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)BOOLValue
{
  id v2 = [(_DKEvent *)self value];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)integerValue
{
  id v2 = [(_DKEvent *)self value];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (double)doubleValue
{
  id v2 = [(_DKEvent *)self value];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_DKEvent *)a3;
  int v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v52.receiver = self;
        v52.super_class = (Class)_DKEvent;
        if ([(_DKObject *)&v52 isEqual:v5])
        {
          uint64_t v6 = v5;
          id v7 = [(_DKEvent *)self stream];
          uint64_t v8 = [(_DKEvent *)v6 stream];
          if (v7 != v8)
          {
            id v9 = [(_DKEvent *)self stream];
            uint64_t v10 = [(_DKEvent *)v6 stream];
            if (![v9 isEqual:v10])
            {
              char v11 = 0;
              goto LABEL_41;
            }
            uint64_t v49 = v10;
            uint64_t v50 = v9;
          }
          NSInteger v12 = [(_DKEvent *)self startDate];
          id v13 = [(_DKEvent *)v6 startDate];
          if (v12 != v13)
          {
            double v14 = [(_DKEvent *)self startDate];
            uint64_t v15 = [(_DKEvent *)v6 startDate];
            if (![v14 isEqual:v15])
            {
              char v11 = 0;
LABEL_39:

LABEL_40:
              uint64_t v10 = v49;
              id v9 = v50;
              if (v7 == v8)
              {
LABEL_42:

                goto LABEL_43;
              }
LABEL_41:

              goto LABEL_42;
            }
            uint64_t v47 = v15;
            uint64_t v48 = v14;
          }
          uint64_t v16 = [(_DKEvent *)self endDate];
          id v17 = [(_DKEvent *)v6 endDate];
          long long v51 = (void *)v16;
          if ((void *)v16 != v17)
          {
            id v18 = [(_DKEvent *)self endDate];
            long long v44 = [(_DKEvent *)v6 endDate];
            uint64_t v45 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              char v11 = 0;
LABEL_37:

LABEL_38:
              uint64_t v15 = v47;
              double v14 = v48;
              if (v12 == v13) {
                goto LABEL_40;
              }
              goto LABEL_39;
            }
          }
          id v19 = [(_DKEvent *)self timeZone];
          uint64_t v46 = [(_DKEvent *)v6 timeZone];
          if (v19 != (void *)v46)
          {
            uint64_t v20 = v19;
            long long v43 = [(_DKEvent *)self timeZone];
            uint64_t v21 = [v43 secondsFromGMT];
            uint64_t v42 = [(_DKEvent *)v6 timeZone];
            if (v21 != [v42 secondsFromGMT])
            {
              char v11 = 0;
              id v19 = v20;
              uint64_t v27 = (void *)v46;
LABEL_35:

LABEL_36:
              if (v51 == v17) {
                goto LABEL_38;
              }
              goto LABEL_37;
            }
            id v19 = v20;
          }
          [(_DKEvent *)self confidence];
          double v23 = v22;
          [(_DKEvent *)v6 confidence];
          if (v23 != v24
            || (long long v41 = v19,
                BOOL v25 = [(_DKEvent *)self shouldSync],
                BOOL v26 = v25 == [(_DKEvent *)v6 shouldSync],
                id v19 = v41,
                !v26))
          {
            char v11 = 0;
            goto LABEL_34;
          }
          uint64_t v28 = [(_DKEvent *)self value];
          uint64_t v39 = [(_DKEvent *)v6 value];
          id v40 = (void *)v28;
          if (v28 == v39
            || ([(_DKEvent *)self value],
                uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                [(_DKEvent *)v6 value],
                uint64_t v37 = objc_claimAutoreleasedReturnValue(),
                uint64_t v38 = v29,
                objc_msgSend(v29, "isEqual:")))
          {
            id v31 = [(_DKEvent *)self metadata];
            uint64_t v35 = [(_DKEvent *)v6 metadata];
            objc_super v36 = v31;
            if (v31 == v35)
            {

              char v11 = 1;
            }
            else
            {
              uint64_t v32 = [(_DKEvent *)self metadata];
              uint64_t v33 = [(_DKEvent *)v6 metadata];
              char v11 = [v32 isEqual:v33];

              id v19 = v41;
            }
            uint64_t v30 = (void *)v39;
            if (v40 == (void *)v39) {
              goto LABEL_33;
            }
          }
          else
          {
            char v11 = 0;
            uint64_t v30 = (void *)v39;
          }

LABEL_33:
LABEL_34:
          uint64_t v27 = (void *)v46;
          if (v19 == (void *)v46) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
    }
    char v11 = 0;
  }
LABEL_43:

  return v11;
}

- (void)setStartDate:(id)a3
{
}

- (void)setStream:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

+ (void)eventWithStream:(void *)a1 source:startDate:endDate:categoryIntegerValue:confidence:metadata:.cold.1(void *a1)
{
  v1 = [a1 eventValueType];
  id v2 = NSStringFromClass((Class)[v1 objectClass]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v3, v4, "_DKEvent stream category type must be _DKCategory. Found %@", v5, v6, v7, v8, v9);
}

+ (void)eventWithStream:(void *)a1 source:startDate:endDate:quantityDoubleValue:confidence:metadata:.cold.1(void *a1)
{
  v1 = [a1 eventValueType];
  id v2 = NSStringFromClass((Class)[v1 objectClass]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v3, v4, "_DKEvent stream quantity type must be _DKQuantity. Found %@", v5, v6, v7, v8, v9);
}

+ (void)eventWithStream:(void *)a1 source:startDate:endDate:identifierStringValue:confidence:metadata:.cold.1(void *a1)
{
  v1 = [a1 eventValueType];
  id v2 = NSStringFromClass((Class)[v1 objectClass]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v3, v4, "_DKEvent stream identifier type must be _DKIdentifier. Found %@", v5, v6, v7, v8, v9);
}

- (void)initWithStream:source:startDate:endDate:value:confidence:metadata:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_ERROR, "_DKEvent endDate (%@) must be at or later than startDate (%@).", v2, 0x16u);
}

- (void)initWithStream:(NSObject *)a3 source:startDate:endDate:value:confidence:metadata:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 eventValueType];
  uint64_t v5 = NSStringFromClass((Class)[v4 objectClass]);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138412546;
  uint8_t v9 = v5;
  __int16 v10 = 2112;
  char v11 = v7;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "_DKEvent stream type and value class mismatch. %@ != %@", (uint8_t *)&v8, 0x16u);
}

@end