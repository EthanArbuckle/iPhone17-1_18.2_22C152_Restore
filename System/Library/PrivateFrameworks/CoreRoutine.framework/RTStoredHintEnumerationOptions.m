@interface RTStoredHintEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (NSNumber)distance;
- (NSNumber)sourceFilter;
- (RTLocation)referenceLocation;
- (RTStoredHintEnumerationOptions)init;
- (RTStoredHintEnumerationOptions)initWithCoder:(id)a3;
- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 ascending:(BOOL)a4 dateInterval:(id)a5 limit:(unint64_t)a6 batchSize:(unint64_t)a7;
- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 sourceFilter:(id)a4 ascending:(BOOL)a5 dateInterval:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8;
- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 sourceFilter:(id)a4 ascending:(BOOL)a5 distance:(id)a6 dateInterval:(id)a7 limit:(unint64_t)a8 batchSize:(unint64_t)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTStoredHintEnumerationOptions

- (RTStoredHintEnumerationOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithReferenceLocation_sourceFilter_ascending_distance_dateInterval_limit_batchSize_);
}

- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 ascending:(BOOL)a4 dateInterval:(id)a5 limit:(unint64_t)a6 batchSize:(unint64_t)a7
{
  return [(RTStoredHintEnumerationOptions *)self initWithReferenceLocation:a3 sourceFilter:0 ascending:a4 distance:0 dateInterval:a5 limit:a6 batchSize:a7];
}

- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 sourceFilter:(id)a4 ascending:(BOOL)a5 dateInterval:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8
{
  return [(RTStoredHintEnumerationOptions *)self initWithReferenceLocation:a3 sourceFilter:a4 ascending:a5 distance:0 dateInterval:a6 limit:a7 batchSize:a8];
}

- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 sourceFilter:(id)a4 ascending:(BOOL)a5 distance:(id)a6 dateInterval:(id)a7 limit:(unint64_t)a8 batchSize:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  if ([v17 integerValue])
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_7:

    id v18 = 0;
    goto LABEL_8;
  }

  id v17 = 0;
  if (!v16) {
    goto LABEL_7;
  }
LABEL_3:
  if (!v18) {
    id v18 = &unk_1EFF91B50;
  }
LABEL_8:
  v23.receiver = self;
  v23.super_class = (Class)RTStoredHintEnumerationOptions;
  v20 = [(RTStoredHintEnumerationOptions *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_ascending = a5;
    objc_storeStrong((id *)&v20->_referenceLocation, a3);
    objc_storeStrong((id *)&v21->_sourceFilter, v17);
    objc_storeStrong((id *)&v21->_distance, v18);
    objc_storeStrong((id *)&v21->_dateInterval, a7);
    v21->_limit = a8;
    v21->_batchSize = a9;
  }

  return v21;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithBool:self->_ascending];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NSDateInterval *)self->_dateInterval hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_distance hash];
  v9 = [NSNumber numberWithUnsignedInteger:self->_limit];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(RTLocation *)self->_referenceLocation hash];
  unint64_t v12 = v10 ^ v11 ^ [(NSNumber *)self->_sourceFilter hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RTStoredHintEnumerationOptions *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v23 = [(RTStoredHintEnumerationOptions *)self ascending];
      int v22 = [(RTStoredHintEnumerationOptions *)v5 ascending];
      unint64_t v21 = [(RTStoredHintEnumerationOptions *)self batchSize];
      uint64_t v20 = [(RTStoredHintEnumerationOptions *)v5 batchSize];
      uint64_t v6 = [(RTStoredHintEnumerationOptions *)self dateInterval];
      uint64_t v7 = [(RTStoredHintEnumerationOptions *)v5 dateInterval];
      int v19 = [v6 isEqualToDateInterval:v7];

      uint64_t v8 = [(RTStoredHintEnumerationOptions *)self distance];
      v9 = [(RTStoredHintEnumerationOptions *)v5 distance];

      unint64_t v10 = [(RTStoredHintEnumerationOptions *)self limit];
      uint64_t v11 = [(RTStoredHintEnumerationOptions *)v5 limit];
      unint64_t v12 = [(RTStoredHintEnumerationOptions *)self referenceLocation];
      v13 = [(RTStoredHintEnumerationOptions *)v5 referenceLocation];
      char v14 = [v12 isEqualToLocation:v13];

      v15 = [(RTStoredHintEnumerationOptions *)self sourceFilter];
      id v16 = [(RTStoredHintEnumerationOptions *)v5 sourceFilter];

      BOOL v17 = 0;
      if (v23 == v22 && v21 == v20 && v19 && v8 == v9 && v10 == v11)
      {
        if (v15 == v16) {
          BOOL v17 = v14;
        }
        else {
          BOOL v17 = 0;
        }
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", self->_referenceLocation, self->_sourceFilter, self->_ascending, self->_distance, self->_dateInterval, self->_limit, self->_batchSize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL ascending = self->_ascending;
  id v5 = a3;
  [v5 encodeBool:ascending forKey:@"ascending"];
  [v5 encodeInteger:self->_batchSize forKey:@"batchSize"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_distance forKey:@"distance"];
  [v5 encodeInteger:self->_limit forKey:@"limit"];
  [v5 encodeObject:self->_referenceLocation forKey:@"referenceLocation"];
  [v5 encodeObject:self->_sourceFilter forKey:@"sourceFilter"];
}

- (RTStoredHintEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"ascending"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"batchSize"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distance"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"limit"];
  unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceLocation"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceFilter"];

  unint64_t v12 = [(RTStoredHintEnumerationOptions *)self initWithReferenceLocation:v10 sourceFilter:v11 ascending:v5 distance:v8 dateInterval:v7 limit:v9 batchSize:v6];
  return v12;
}

- (id)description
{
  v3 = NSString;
  sourceFilter = self->_sourceFilter;
  if (self->_ascending) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  distance = self->_distance;
  uint64_t v7 = [(NSDateInterval *)self->_dateInterval startDate];
  uint64_t v8 = [v7 stringFromDate];
  uint64_t v9 = [(NSDateInterval *)self->_dateInterval endDate];
  unint64_t v10 = [v9 stringFromDate];
  uint64_t v11 = [v3 stringWithFormat:@"ascending, %@, sourceFilter, %@, distance, %@, startDate, %@, endDate, %@, limit, %ld", v5, sourceFilter, distance, v8, v10, self->_limit];

  return v11;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (NSNumber)sourceFilter
{
  return self->_sourceFilter;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sourceFilter, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

@end