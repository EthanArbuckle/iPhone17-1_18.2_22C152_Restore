@interface BMBehaviorDatabaseMetadata
- (BMBehaviorDatabaseMetadata)initWithDictionary:(id)a3;
- (BMBehaviorDatabaseMetadata)initWithMiningDate:(id)a3 eventInterval:(id)a4 minimumAbsoluteSupport:(unint64_t)a5 minimumConfidence:(double)a6 samplingInterval:(double)a7 itemTypeIdentifiers:(id)a8 targetTypeIdentifiers:(id)a9 numberOfBaskets:(unint64_t)a10;
- (BOOL)isEqual:(id)a3;
- (NSArray)itemTypeIdentifiers;
- (NSArray)targetTypeIdentifiers;
- (NSDate)miningDate;
- (NSDateInterval)eventInterval;
- (double)minimumConfidence;
- (double)samplingInterval;
- (id)description;
- (id)dictionaryRepresntation;
- (unint64_t)hash;
- (unint64_t)minimumAbsoluteSupport;
- (unint64_t)numberOfBaskets;
@end

@implementation BMBehaviorDatabaseMetadata

- (BMBehaviorDatabaseMetadata)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"BMBehaviorDatabaseMetadata"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"miningDate"];
    id v7 = objc_alloc(MEMORY[0x263F08798]);
    v23 = [v5 objectForKeyedSubscript:@"eventIntervalStart"];
    v22 = [v5 objectForKeyedSubscript:@"eventIntervalEnd"];
    v20 = (void *)[v7 initWithStartDate:v23 endDate:v22];
    v21 = [v5 objectForKeyedSubscript:@"minimumAbsoluteSupport"];
    uint64_t v8 = [v21 unsignedIntegerValue];
    v9 = [v5 objectForKeyedSubscript:@"minimumConfidence"];
    [v9 doubleValue];
    double v11 = v10;
    v12 = [v5 objectForKeyedSubscript:@"samplingInterval"];
    [v12 doubleValue];
    double v14 = v13;
    v15 = [v5 objectForKeyedSubscript:@"itemTypeIdentifiers"];
    v16 = [v5 objectForKeyedSubscript:@"targetTypeIdentifiers"];
    v17 = [v5 objectForKeyedSubscript:@"numberOfBaskets"];
    self = -[BMBehaviorDatabaseMetadata initWithMiningDate:eventInterval:minimumAbsoluteSupport:minimumConfidence:samplingInterval:itemTypeIdentifiers:targetTypeIdentifiers:numberOfBaskets:](self, "initWithMiningDate:eventInterval:minimumAbsoluteSupport:minimumConfidence:samplingInterval:itemTypeIdentifiers:targetTypeIdentifiers:numberOfBaskets:", v6, v20, v8, v15, v16, [v17 unsignedIntegerValue], v11, v14);

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BMBehaviorDatabaseMetadata)initWithMiningDate:(id)a3 eventInterval:(id)a4 minimumAbsoluteSupport:(unint64_t)a5 minimumConfidence:(double)a6 samplingInterval:(double)a7 itemTypeIdentifiers:(id)a8 targetTypeIdentifiers:(id)a9 numberOfBaskets:(unint64_t)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a8;
  id v21 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BMBehaviorDatabaseMetadata;
  v22 = [(BMBehaviorDatabaseMetadata *)&v28 init];
  if (v22)
  {
    if (v18)
    {
      uint64_t v23 = [v18 copy];
    }
    else
    {
      uint64_t v23 = [MEMORY[0x263EFF910] distantPast];
    }
    miningDate = v22->_miningDate;
    v22->_miningDate = (NSDate *)v23;

    uint64_t v25 = [v19 copy];
    eventInterval = v22->_eventInterval;
    v22->_eventInterval = (NSDateInterval *)v25;

    v22->_minimumAbsoluteSupport = a5;
    v22->_minimumConfidence = a6;
    v22->_samplingInterval = a7;
    objc_storeStrong((id *)&v22->_itemTypeIdentifiers, a8);
    objc_storeStrong((id *)&v22->_targetTypeIdentifiers, a9);
    v22->_numberOfBaskets = a10;
  }

  return v22;
}

- (id)dictionaryRepresntation
{
  v22[1] = *MEMORY[0x263EF8340];
  id v21 = @"BMBehaviorDatabaseMetadata";
  v19[0] = @"miningDate";
  id v18 = [(BMBehaviorDatabaseMetadata *)self miningDate];
  v20[0] = v18;
  v19[1] = @"eventIntervalStart";
  v17 = [(BMBehaviorDatabaseMetadata *)self eventInterval];
  v16 = [v17 startDate];
  v20[1] = v16;
  v19[2] = @"eventIntervalEnd";
  v3 = [(BMBehaviorDatabaseMetadata *)self eventInterval];
  v4 = [v3 endDate];
  v20[2] = v4;
  v19[3] = @"minimumAbsoluteSupport";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata minimumAbsoluteSupport](self, "minimumAbsoluteSupport"));
  v20[3] = v5;
  v19[4] = @"minimumConfidence";
  v6 = NSNumber;
  [(BMBehaviorDatabaseMetadata *)self minimumConfidence];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  v20[4] = v7;
  v19[5] = @"samplingInterval";
  uint64_t v8 = NSNumber;
  [(BMBehaviorDatabaseMetadata *)self samplingInterval];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v20[5] = v9;
  v19[6] = @"itemTypeIdentifiers";
  double v10 = [(BMBehaviorDatabaseMetadata *)self itemTypeIdentifiers];
  v20[6] = v10;
  v19[7] = @"targetTypeIdentifiers";
  double v11 = [(BMBehaviorDatabaseMetadata *)self targetTypeIdentifiers];
  v20[7] = v11;
  v19[8] = @"numberOfBaskets";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata numberOfBaskets](self, "numberOfBaskets"));
  v20[8] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:9];
  v22[0] = v13;
  double v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  return v14;
}

- (unint64_t)hash
{
  v3 = [(BMBehaviorDatabaseMetadata *)self miningDate];
  uint64_t v4 = [v3 hash];
  v5 = [(BMBehaviorDatabaseMetadata *)self eventInterval];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(BMBehaviorDatabaseMetadata *)self minimumAbsoluteSupport];
  [(BMBehaviorDatabaseMetadata *)self minimumConfidence];
  unint64_t v9 = v7 ^ (unint64_t)(v8 * 1000.0);
  [(BMBehaviorDatabaseMetadata *)self samplingInterval];
  unint64_t v11 = (unint64_t)(v10 * 1000.0);
  v12 = [(BMBehaviorDatabaseMetadata *)self itemTypeIdentifiers];
  uint64_t v13 = v9 ^ v11 ^ [v12 hash];
  double v14 = [(BMBehaviorDatabaseMetadata *)self targetTypeIdentifiers];
  uint64_t v15 = [v14 hash];
  unint64_t v16 = v13 ^ v15 ^ [(BMBehaviorDatabaseMetadata *)self numberOfBaskets];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BMBehaviorDatabaseMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(BMBehaviorDatabaseMetadata *)self dictionaryRepresntation];
    double v8 = [(BMBehaviorDatabaseMetadata *)v6 dictionaryRepresntation];

    char v9 = [v7 isEqualToDictionary:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  unint64_t v16 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(BMBehaviorDatabaseMetadata *)self miningDate];
  v5 = [(BMBehaviorDatabaseMetadata *)self eventInterval];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata minimumAbsoluteSupport](self, "minimumAbsoluteSupport"));
  unint64_t v7 = NSNumber;
  [(BMBehaviorDatabaseMetadata *)self minimumConfidence];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  char v9 = NSNumber;
  [(BMBehaviorDatabaseMetadata *)self samplingInterval];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  unint64_t v11 = [(BMBehaviorDatabaseMetadata *)self itemTypeIdentifiers];
  v12 = [(BMBehaviorDatabaseMetadata *)self targetTypeIdentifiers];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata numberOfBaskets](self, "numberOfBaskets"));
  double v14 = [v16 stringWithFormat:@"<%@ %p> miningDate: %@, eventInterval: %@, minimumAbsoluteSupport: %@, minimumConfidence: %@, samplingInterval: %@s, itemTypeIdentifiers: %@, targetTypeIdentifiers: %@, numberOfBaskets: %@", v3, self, v4, v5, v6, v8, v10, v11, v12, v13];

  return v14;
}

- (NSDate)miningDate
{
  return self->_miningDate;
}

- (NSDateInterval)eventInterval
{
  return self->_eventInterval;
}

- (unint64_t)minimumAbsoluteSupport
{
  return self->_minimumAbsoluteSupport;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (NSArray)itemTypeIdentifiers
{
  return self->_itemTypeIdentifiers;
}

- (NSArray)targetTypeIdentifiers
{
  return self->_targetTypeIdentifiers;
}

- (unint64_t)numberOfBaskets
{
  return self->_numberOfBaskets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventInterval, 0);

  objc_storeStrong((id *)&self->_miningDate, 0);
}

@end