@interface _DKHistogram
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
- (BOOL)isEqual:(id)a3;
- (NSArray)deviceIdentifiers;
- (NSDateInterval)interval;
- (NSDictionary)histogram;
- (NSString)customIdentifier;
- (NSUUID)identifier;
- (_DKEventStream)stream;
- (_DKHistogram)init;
- (_DKHistogram)initWithCoder:(id)a3;
- (_DKHistogram)initWithHistogram:(id)a3;
- (_DKHistogram)initWithManagedObject:(id)a3;
- (_DKHistogram)initWithValues:(id)a3;
- (double)countForValueDouble:(id)a3;
- (double)relativeFrequencyForValue:(id)a3;
- (id)countDictionary;
- (id)description;
- (id)insertInManagedObjectContext:(id)a3;
- (unint64_t)countForValue:(id)a3;
- (unint64_t)countOverAllValues;
- (void)_addPropertiesFrom:(id)a3;
- (void)addHistogram:(id)a3;
- (void)addHistogram:(id)a3 decayingExistingCounts:(double)a4;
- (void)addValue:(id)a3;
- (void)addValue:(id)a3 withCount:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCountOverAllValues:(unint64_t)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setDeviceIdentifiers:(id)a3;
- (void)setHistogram:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterval:(id)a3;
- (void)setStream:(id)a3;
- (void)subtractHistogram:(id)a3;
- (void)subtractValue:(id)a3;
@end

@implementation _DKHistogram

- (_DKHistogram)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DKHistogram;
  v2 = [(_DKHistogram *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    histogram = v2->_histogram;
    v2->_histogram = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v5;

    v2->_countOverAllValues = 0;
  }
  return v2;
}

- (_DKHistogram)initWithValues:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_DKHistogram *)self init];
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v12 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_histogram, "objectForKeyedSubscript:", v11, (void)v16);
          uint64_t v13 = [v12 unsignedIntegerValue];

          v14 = [NSNumber numberWithUnsignedInteger:v13 + 1];
          [(NSMutableDictionary *)v5->_histogram setObject:v14 forKeyedSubscript:v11];

          ++v5->_countOverAllValues;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (_DKHistogram)initWithHistogram:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_DKHistogram *)self init];
  id v6 = v5;
  if (v5)
  {
    [(NSMutableDictionary *)v5->_histogram addEntriesFromDictionary:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = v6->_histogram;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = -[NSMutableDictionary objectForKeyedSubscript:](v6->_histogram, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
          v6->_countOverAllValues += [v12 unsignedIntegerValue];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (unint64_t)countForValue:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)countForValueDouble:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)relativeFrequencyForValue:(id)a3
{
  double v4 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:a3];
  [v4 doubleValue];
  double v6 = v5 / (double)self->_countOverAllValues;

  return v6;
}

- (id)countDictionary
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_histogram];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_DKHistogram *)a3;
  double v5 = v4;
  if (self == v4)
  {
    char v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v6 = v5;
    histogram = self->_histogram;
    uint64_t v8 = [(_DKHistogram *)v6 histogram];
    if ([(NSMutableDictionary *)histogram isEqualToDictionary:v8])
    {
      identifier = self->_identifier;
      uint64_t v10 = [(_DKHistogram *)v6 identifier];
      if ([(NSUUID *)identifier isEqual:v10])
      {
        deviceIdentifiers = self->_deviceIdentifiers;
        v12 = [(_DKHistogram *)v6 deviceIdentifiers];
        if ([(NSArray *)deviceIdentifiers isEqualToArray:v12])
        {
          interval = self->_interval;
          long long v14 = [(_DKHistogram *)v6 interval];
          if ([(NSDateInterval *)interval isEqualToDateInterval:v14])
          {
            stream = self->_stream;
            long long v16 = [(_DKHistogram *)v6 stream];
            char v17 = [(_DKEventStream *)stream isEqual:v16];
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)addValue:(id)a3
{
  id v8 = a3;
  double v4 = (void *)MEMORY[0x192FB2F20]();
  double v5 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v8];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6 + 1];
  [(NSMutableDictionary *)self->_histogram setObject:v7 forKeyedSubscript:v8];

  ++self->_countOverAllValues;
}

- (void)addValue:(id)a3 withCount:(double)a4
{
  id v11 = a3;
  uint64_t v6 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v7 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v11];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [NSNumber numberWithDouble:v9 + a4];
  [(NSMutableDictionary *)self->_histogram setObject:v10 forKeyedSubscript:v11];

  ++self->_countOverAllValues;
}

- (void)subtractValue:(id)a3
{
  id v9 = a3;
  double v4 = (void *)MEMORY[0x192FB2F20]();
  double v5 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v9];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v9];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if (v7 == 1)
    {
      [(NSMutableDictionary *)self->_histogram removeObjectForKey:v9];
    }
    else
    {
      double v8 = [NSNumber numberWithUnsignedInteger:v7 - 1];
      [(NSMutableDictionary *)self->_histogram setObject:v8 forKeyedSubscript:v9];
    }
    --self->_countOverAllValues;
  }
}

- (void)_addPropertiesFrom:(id)a3
{
  id v28 = a3;
  double v4 = [(_DKHistogram *)self interval];
  double v5 = [v4 startDate];
  uint64_t v6 = [v28 interval];
  uint64_t v7 = [v6 startDate];
  double v8 = [v5 earlierDate:v7];

  id v9 = [v28 interval];
  uint64_t v10 = [v9 endDate];
  id v11 = [(_DKHistogram *)self interval];
  v12 = [v11 endDate];
  uint64_t v13 = [v10 laterDate:v12];

  if (v8 && v13)
  {
    long long v14 = (NSDateInterval *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v13];
  }
  else
  {
    long long v15 = [v28 interval];

    long long v16 = v28;
    if (!v15) {
      goto LABEL_7;
    }
    long long v14 = [v28 interval];
  }
  interval = self->_interval;
  self->_interval = v14;

  long long v16 = v28;
LABEL_7:
  long long v18 = [v16 identifier];
  identifier = self->_identifier;
  self->_identifier = v18;

  v20 = [v28 customIdentifier];
  customIdentifier = self->_customIdentifier;
  self->_customIdentifier = v20;

  deviceIdentifiers = self->_deviceIdentifiers;
  v23 = [v28 deviceIdentifiers];
  v24 = [(NSArray *)deviceIdentifiers arrayByAddingObjectsFromArray:v23];
  v25 = self->_deviceIdentifiers;
  self->_deviceIdentifiers = v24;

  v26 = [v28 stream];
  stream = self->_stream;
  self->_stream = v26;
}

- (void)addHistogram:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192FB2F20]();
  [(_DKHistogram *)self _addPropertiesFrom:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v5 = [v4 histogram];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v10];
        [v11 doubleValue];
        double v13 = v12;

        long long v14 = [v4 histogram];
        long long v15 = [v14 objectForKeyedSubscript:v10];
        [v15 doubleValue];
        double v17 = v16;

        long long v18 = [NSNumber numberWithDouble:v13 + v17];
        [(NSMutableDictionary *)self->_histogram setObject:v18 forKeyedSubscript:v10];

        self->_countOverAllValues = (unint64_t)(v17 + (double)self->_countOverAllValues);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)addHistogram:(id)a3 decayingExistingCounts:(double)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x192FB2F20]();
  [(_DKHistogram *)self _addPropertiesFrom:v6];
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_histogram copy];
  uint64_t v21 = 0;
  long long v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke;
  v16[3] = &unk_1E560EF60;
  id v9 = v6;
  double v20 = a4;
  id v17 = v9;
  long long v18 = self;
  uint64_t v19 = &v21;
  [v8 enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v10 = [v9 histogram];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke_2;
  v12[3] = &unk_1E560EF88;
  id v11 = v8;
  id v13 = v11;
  long long v14 = self;
  long long v15 = &v21;
  [v10 enumerateKeysAndObjectsUsingBlock:v12];

  self->_countOverAllValues = llround(v22[3]);
  _Block_object_dispose(&v21, 8);
}

- (void)subtractHistogram:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192FB2F20]();
  double v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_deviceIdentifiers];
  deviceIdentifiers = self->_deviceIdentifiers;
  self->_deviceIdentifiers = v5;

  uint64_t v7 = self->_deviceIdentifiers;
  uint64_t v8 = [v4 deviceIdentifiers];
  [(NSArray *)v7 removeObjectsInArray:v8];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [v4 histogram];
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
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v14];
        unint64_t v16 = [v15 unsignedIntegerValue];

        unint64_t v17 = [v4 countForValue:v14];
        if (v16 <= v17)
        {
          [(NSMutableDictionary *)self->_histogram removeObjectForKey:v14];
        }
        else
        {
          unint64_t v18 = v17;
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:v16 - v17];
          [(NSMutableDictionary *)self->_histogram setObject:v19 forKeyedSubscript:v14];

          unint64_t v16 = v18;
        }
        self->_countOverAllValues -= v16;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [(_DKHistogram *)self stream];
  uint64_t v7 = [(_DKHistogram *)self identifier];
  uint64_t v8 = [(_DKHistogram *)self customIdentifier];
  id v9 = [(_DKHistogram *)self interval];
  uint64_t v10 = [(_DKHistogram *)self deviceIdentifiers];
  uint64_t v11 = [(_DKHistogram *)self histogram];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKHistogram countOverAllValues](self, "countOverAllValues"));
  objc_msgSend(v3, "stringWithFormat:", @"%@:{stream=%@; identifier=%@; customIdentifier=%@, interval=%@; deviceIdentifiers=%@; histogram=%@; countOverAllValues=%@}",
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
  id v13 = v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKHistogram)initWithCoder:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  uint64_t v7 = [v4 setWithArray:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v10 = objc_msgSend(v8, "setWithArray:", v9, v20[0]);

  uint64_t v11 = [v5 decodeObjectOfClasses:v7 forKey:@"histogram"];
  uint64_t v12 = [v5 decodeObjectOfClasses:v10 forKey:@"deviceIdentifiers"];
  id v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
  uint64_t v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"stream"];
  long long v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"customIdentifier"];

  unint64_t v17 = [(_DKHistogram *)self initWithHistogram:v11];
  unint64_t v18 = v17;
  if (v17)
  {
    [(_DKHistogram *)v17 setDeviceIdentifiers:v12];
    [(_DKHistogram *)v18 setInterval:v13];
    [(_DKHistogram *)v18 setStream:v14];
    [(_DKHistogram *)v18 setIdentifier:v15];
    [(_DKHistogram *)v18 setCustomIdentifier:v16];
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  histogram = self->_histogram;
  id v5 = a3;
  [v5 encodeObject:histogram forKey:@"histogram"];
  [v5 encodeObject:self->_deviceIdentifiers forKey:@"deviceIdentifiers"];
  [v5 encodeObject:self->_interval forKey:@"interval"];
  [v5 encodeObject:self->_stream forKey:@"stream"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_customIdentifier forKey:@"customIdentifier"];
}

- (NSDictionary)histogram
{
  return &self->_histogram->super;
}

- (void)setHistogram:(id)a3
{
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (void)setInterval:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
}

- (unint64_t)countOverAllValues
{
  return self->_countOverAllValues;
}

- (void)setCountOverAllValues:(unint64_t)a3
{
  self->_countOverAllValues = a3;
}

- (_DKEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (NSArray)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
}

- (_DKHistogram)initWithManagedObject:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_DKHistogram;
  id v5 = [(_DKHistogram *)&v46 init];
  if (!v5) {
    goto LABEL_22;
  }
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = [v4 value];
  uint64_t v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v41 = v4;
  id v9 = [v4 value];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v43 != v13) {
        objc_enumerationMutation(v9);
      }
      long long v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      unint64_t v16 = [v15 stringValue];

      if (v16)
      {
        uint64_t v17 = [v15 stringValue];
      }
      else
      {
        unint64_t v18 = [v15 integerValue];

        if (!v18)
        {
          uint64_t v19 = +[_CDLogging knowledgeChannel];
          id v4 = v41;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[_DKHistogram(CoreData) initWithManagedObject:]((uint64_t)v41, v19);
          }
          goto LABEL_25;
        }
        uint64_t v17 = [v15 integerValue];
      }
      uint64_t v19 = v17;
      double v20 = [v15 count];

      if (!v20)
      {
        long long v23 = +[_CDLogging knowledgeChannel];
        id v4 = v41;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[_DKHistogram(CoreData) initWithManagedObject:]((uint64_t)v41, v23);
        }

LABEL_25:
        v39 = 0;
        goto LABEL_26;
      }
      long long v21 = [v15 count];
      [v8 setObject:v21 forKeyedSubscript:v19];

      long long v22 = [v15 count];
      v12 += [v22 unsignedIntegerValue];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_19:

  id v4 = v41;
  long long v24 = [v41 streamTypeCode];
  uint64_t v25 = +[_DKObjectType objectTypeWithTypeCode:](_DKObjectType, "objectTypeWithTypeCode:", [v24 integerValue]);

  uint64_t v26 = [v41 streamName];
  v27 = +[_DKEventStream eventStreamWithName:v26 valueType:v25];

  id v28 = objc_alloc(MEMORY[0x1E4F28C18]);
  v29 = [v41 startDate];
  v30 = [v41 endDate];
  v31 = (void *)[v28 initWithStartDate:v29 endDate:v30];
  [(_DKHistogram *)v5 setInterval:v31];

  [(_DKHistogram *)v5 setHistogram:v8];
  v32 = [v41 deviceIdentifier];

  if (v32)
  {
    v33 = [v41 deviceIdentifier];
    v47 = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [(_DKHistogram *)v5 setDeviceIdentifiers:v34];
  }
  [(_DKHistogram *)v5 setStream:v27];
  id v35 = objc_alloc(MEMORY[0x1E4F29128]);
  v36 = [v41 identifier];
  v37 = (void *)[v35 initWithUUIDString:v36];
  [(_DKHistogram *)v5 setIdentifier:v37];

  v38 = [v41 customIdentifier];
  [(_DKHistogram *)v5 setCustomIdentifier:v38];

  [(_DKHistogram *)v5 setCountOverAllValues:v12];
LABEL_22:
  v39 = v5;
LABEL_26:

  return v39;
}

+ (id)entityName
{
  return @"Histogram";
}

- (id)insertInManagedObjectContext:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = +[_DKHistogram entityName];
  uint64_t v7 = [v5 insertNewObjectForEntityForName:v6 inManagedObjectContext:v4];

  uint64_t v8 = [(_DKHistogram *)self interval];
  id v9 = [v8 startDate];
  [v7 setStartDate:v9];

  uint64_t v10 = [(_DKHistogram *)self interval];
  uint64_t v11 = [v10 endDate];
  [v7 setEndDate:v11];

  uint64_t v12 = [(_DKHistogram *)self identifier];
  uint64_t v13 = [v12 UUIDString];
  [v7 setIdentifier:v13];

  uint64_t v14 = [(_DKHistogram *)self customIdentifier];
  [v7 setCustomIdentifier:v14];

  long long v15 = [(_DKHistogram *)self stream];
  unint64_t v16 = [v15 name];
  [v7 setStreamName:v16];

  uint64_t v17 = NSNumber;
  unint64_t v18 = [(_DKHistogram *)self stream];
  uint64_t v19 = [v18 eventValueType];
  double v20 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v19, "typeCode"));
  [v7 setStreamTypeCode:v20];

  long long v21 = [(_DKHistogram *)self deviceIdentifiers];
  unint64_t v22 = [v21 count];

  if (v22 <= 1)
  {
    long long v24 = [(_DKHistogram *)self deviceIdentifiers];
    uint64_t v25 = [v24 firstObject];
    [v7 setDeviceIdentifier:v25];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v26 = self;
    id obj = [(_DKHistogram *)self histogram];
    uint64_t v27 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v40;
      id v30 = v4;
      v31 = v7;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v34 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"HistogramValue" inManagedObjectContext:v4];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v34 setIntegerValue:v33];
          }
          else {
            [v34 setStringValue:v33];
          }
          id v35 = [(_DKHistogram *)v26 histogram];
          v36 = [v35 objectForKeyedSubscript:v33];
          [v34 setCount:v36];

          uint64_t v7 = v31;
          [v31 addValueObject:v34];

          id v4 = v30;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v28);
    }

    [v4 insertObject:v7];
    id v23 = v7;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

@end