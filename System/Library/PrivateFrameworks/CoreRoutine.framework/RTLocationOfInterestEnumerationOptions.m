@interface RTLocationOfInterestEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (BOOL)wrappedVisit;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (RTLocationOfInterestEnumerationOptions)init;
- (RTLocationOfInterestEnumerationOptions)initWithAscending:(BOOL)a3 batchSize:(unint64_t)a4 dateInterval:(id)a5 wrappedVisit:(BOOL)a6;
- (RTLocationOfInterestEnumerationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)processingBlock;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation RTLocationOfInterestEnumerationOptions

- (RTLocationOfInterestEnumerationOptions)init
{
  return [(RTLocationOfInterestEnumerationOptions *)self initWithAscending:1 batchSize:0 dateInterval:0 wrappedVisit:0];
}

- (RTLocationOfInterestEnumerationOptions)initWithAscending:(BOOL)a3 batchSize:(unint64_t)a4 dateInterval:(id)a5 wrappedVisit:(BOOL)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RTLocationOfInterestEnumerationOptions;
  v11 = [(RTLocationOfInterestEnumerationOptions *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_ascending = a3;
    [(RTLocationOfInterestEnumerationOptions *)v11 setDateInterval:v10];
    v12->_batchSize = a4;
    v12->_wrappedVisit = a6;
  }

  return v12;
}

- (void)setDateInterval:(id)a3
{
  id v6 = a3;
  id v9 = v6;
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
    v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v6 = (id)[v7 initWithStartDate:v3 endDate:v4];
  }
  objc_storeStrong((id *)&self->_dateInterval, v6);
  v8 = v9;
  if (!v9)
  {

    v8 = 0;
  }
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)processingBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__RTLocationOfInterestEnumerationOptions_processingBlock__block_invoke;
  v4[3] = &unk_1E5D743B0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1AD0EBF30](v4, a2);
  return v2;
}

id __57__RTLocationOfInterestEnumerationOptions_processingBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "pruneVisitsWithDateInterval:", *(void *)(*(void *)(a1 + 32) + 24), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTLocationOfInterestEnumerationOptions *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(RTLocationOfInterestEnumerationOptions *)self ascending];
      int v7 = [(RTLocationOfInterestEnumerationOptions *)v5 ascending];
      unint64_t v8 = [(RTLocationOfInterestEnumerationOptions *)self batchSize];
      uint64_t v9 = [(RTLocationOfInterestEnumerationOptions *)v5 batchSize];
      id v10 = [(RTLocationOfInterestEnumerationOptions *)self dateInterval];
      v11 = [(RTLocationOfInterestEnumerationOptions *)v5 dateInterval];
      int v12 = [v10 isEqualToDateInterval:v11];

      BOOL v13 = [(RTLocationOfInterestEnumerationOptions *)self wrappedVisit];
      BOOL v14 = v12 & (v13 ^ [(RTLocationOfInterestEnumerationOptions *)v5 wrappedVisit] ^ 1);
      if (v8 != v9) {
        LOBYTE(v14) = 0;
      }
      BOOL v15 = v6 == v7 && v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithBool:self->_ascending];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NSDateInterval *)self->_dateInterval hash];
  unint64_t v8 = [NSNumber numberWithBool:self->_wrappedVisit];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL ascending = self->_ascending;
  unint64_t batchSize = self->_batchSize;
  dateInterval = self->_dateInterval;
  BOOL wrappedVisit = self->_wrappedVisit;
  return (id)[v4 initWithAscending:ascending batchSize:batchSize dateInterval:dateInterval wrappedVisit:wrappedVisit];
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
  [v5 encodeBool:self->_wrappedVisit forKey:@"wrappedVisit"];
}

- (RTLocationOfInterestEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"ascending"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"batchSize"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v8 = [v4 decodeBoolForKey:@"wrappedVisit"];

  unint64_t v9 = [(RTLocationOfInterestEnumerationOptions *)self initWithAscending:v5 batchSize:v6 dateInterval:v7 wrappedVisit:v8];
  return v9;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)wrappedVisit
{
  return self->_wrappedVisit;
}

- (void).cxx_destruct
{
}

@end