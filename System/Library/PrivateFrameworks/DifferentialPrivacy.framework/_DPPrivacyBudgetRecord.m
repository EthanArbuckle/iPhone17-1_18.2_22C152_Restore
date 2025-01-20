@interface _DPPrivacyBudgetRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPrivacyBudgetRecord:(id)a3;
- (BOOL)submitted;
- (NSManagedObjectID)objectId;
- (NSString)key;
- (_DPPrivacyBudgetRecord)init;
- (_DPPrivacyBudgetRecord)initWithCoder:(id)a3;
- (_DPPrivacyBudgetRecord)initWithKey:(id)a3 creationDate:(double)a4 lastUpdate:(double)a5 balance:(int64_t)a6 cohortAggregateBalance:(double)a7 objectId:(id)a8;
- (double)cohortAggregateBalance;
- (double)creationDate;
- (double)lastUpdate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityName;
- (int64_t)balance;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBalance:(int64_t)a3;
- (void)setCohortAggregateBalance:(double)a3;
- (void)setCreationDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setLastUpdate:(double)a3;
- (void)setObjectId:(id)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPPrivacyBudgetRecord

- (_DPPrivacyBudgetRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPPrivacyBudgetRecord *)self initWithKey:@"com.apple.DifferentialPrivacy.default" creationDate:0 lastUpdate:0 balance:v5 cohortAggregateBalance:v5 objectId:0.0];
}

- (_DPPrivacyBudgetRecord)initWithKey:(id)a3 creationDate:(double)a4 lastUpdate:(double)a5 balance:(int64_t)a6 cohortAggregateBalance:(double)a7 objectId:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_DPPrivacyBudgetRecord;
  v17 = [(_DPPrivacyBudgetRecord *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_key, a3);
    v18->_creationDate = a4;
    v18->_lastUpdate = a5;
    v18->_balance = a6;
    v18->_cohortAggregateBalance = a7;
    v18->_submitted = 0;
    objc_storeStrong((id *)&v18->_objectId, a8);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPPrivacyBudgetRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdate"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
  uint64_t v13 = [v12 longLongValue];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cohortAggregateBalance"];

  [v14 doubleValue];
  double v16 = v15;

  v17 = [(_DPPrivacyBudgetRecord *)self initWithKey:v5 creationDate:v13 lastUpdate:0 balance:v8 cohortAggregateBalance:v11 objectId:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeObject:self->_key forKey:@"key"];
  id v4 = [NSNumber numberWithDouble:self->_creationDate];
  [v9 encodeObject:v4 forKey:@"creationDate"];

  double v5 = [NSNumber numberWithDouble:self->_lastUpdate];
  [v9 encodeObject:v5 forKey:@"lastUpdate"];

  v6 = [NSNumber numberWithLongLong:self->_balance];
  [v9 encodeObject:v6 forKey:@"balance"];

  double v7 = [NSNumber numberWithDouble:self->_cohortAggregateBalance];
  [v9 encodeObject:v7 forKey:@"cohortAggregateBalance"];

  objectId = self->_objectId;
  if (objectId) {
    [v9 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { key=%@ ; balance=%lld ; cohortAggregateBalance=%lf ;creationDate=%.16g ; lastUpdate=%.16g ; ",
    v5,
    self->_key,
    self->_balance,
    *(void *)&self->_cohortAggregateBalance,
    *(void *)&self->_creationDate,
  v6 = *(void *)&self->_lastUpdate);

  if (self->_objectId) {
    [v6 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v6 appendString:@"objectId=(nil) }"];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = [(_DPPrivacyBudgetRecord *)self key];
  [(_DPPrivacyBudgetRecord *)self creationDate];
  double v7 = v6;
  [(_DPPrivacyBudgetRecord *)self lastUpdate];
  double v9 = v8;
  int64_t v10 = [(_DPPrivacyBudgetRecord *)self balance];
  [(_DPPrivacyBudgetRecord *)self cohortAggregateBalance];
  double v12 = v11;
  uint64_t v13 = [(_DPPrivacyBudgetRecord *)self objectId];
  v14 = (void *)[v4 initWithKey:v5 creationDate:v10 lastUpdate:v13 balance:v7 cohortAggregateBalance:v9 objectId:v12];

  return v14;
}

- (BOOL)isEqualToPrivacyBudgetRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(_DPPrivacyBudgetRecord *)self key];
    double v6 = [v4 key];
    char v7 = [v5 isEqualToString:v6];

    [(_DPPrivacyBudgetRecord *)self creationDate];
    double v9 = v8;
    [v4 creationDate];
    BOOL v11 = areEqualTimeIntervals(v9, v10);
    [(_DPPrivacyBudgetRecord *)self lastUpdate];
    double v13 = v12;
    [v4 lastUpdate];
    BOOL v15 = areEqualTimeIntervals(v13, v14);
    int64_t v16 = [(_DPPrivacyBudgetRecord *)self balance];
    uint64_t v17 = [v4 balance];
    [(_DPPrivacyBudgetRecord *)self cohortAggregateBalance];
    double v19 = v18;
    [v4 cohortAggregateBalance];
    double v21 = vabdd_f64(v19, v20);
    v22 = [(_DPPrivacyBudgetRecord *)self objectId];

    if (v22)
    {
      v23 = [(_DPPrivacyBudgetRecord *)self objectId];
      v24 = [v4 objectId];
      char v25 = [v23 isEqual:v24];
    }
    else
    {
      v27 = [v4 objectId];

      char v25 = v27 == 0;
    }
    char v28 = v7 & v11 & v15;
    if (v16 != v17) {
      char v28 = 0;
    }
    if (v21 >= 2.22044605e-16) {
      char v28 = 0;
    }
    char v26 = v28 & v25;
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPPrivacyBudgetRecord *)a3;
  double v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPPrivacyBudgetRecord *)self isEqualToPrivacyBudgetRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPPrivacyBudgetRecord *)self key];
  uint64_t v4 = [v3 hash];
  [(_DPPrivacyBudgetRecord *)self creationDate];
  unint64_t v6 = v4 ^ (unint64_t)v5;
  [(_DPPrivacyBudgetRecord *)self lastUpdate];
  unint64_t v8 = v6 ^ (unint64_t)v7 ^ [(_DPPrivacyBudgetRecord *)self balance];
  double v9 = [(_DPPrivacyBudgetRecord *)self objectId];
  unint64_t v10 = v8 ^ [v9 hash];

  return v10;
}

+ (id)createRecordFromManagedObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  int v5 = [v4 copyFromManagedObject:v3];

  if (v5) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)entityName
{
  return @"PrivacyBudgetRecord";
}

- (id)entityName
{
  v2 = objc_opt_class();
  return (id)[v2 entityName];
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    double v7 = [(_DPPrivacyBudgetRecord *)self key];
    [v6 setKey:v7];

    [(_DPPrivacyBudgetRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    [(_DPPrivacyBudgetRecord *)self lastUpdate];
    objc_msgSend(v6, "setLastUpdate:");
    objc_msgSend(v6, "setBalance:", -[_DPPrivacyBudgetRecord balance](self, "balance"));
    [(_DPPrivacyBudgetRecord *)self cohortAggregateBalance];
    objc_msgSend(v6, "setCohortAggregateBalance:");
    unint64_t v8 = [(_DPPrivacyBudgetRecord *)self objectId];
    double v9 = [v6 objectID];

    if (v8 != v9)
    {
      unint64_t v10 = [v6 objectID];
      [(_DPPrivacyBudgetRecord *)self setObjectId:v10];
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    double v7 = [v6 key];
    [(_DPPrivacyBudgetRecord *)self setKey:v7];

    [v6 creationDate];
    -[_DPPrivacyBudgetRecord setCreationDate:](self, "setCreationDate:");
    [v6 lastUpdate];
    -[_DPPrivacyBudgetRecord setLastUpdate:](self, "setLastUpdate:");
    -[_DPPrivacyBudgetRecord setBalance:](self, "setBalance:", [v6 balance]);
    [v6 cohortAggregateBalance];
    -[_DPPrivacyBudgetRecord setCohortAggregateBalance:](self, "setCohortAggregateBalance:");
    unint64_t v8 = [v6 objectID];

    [(_DPPrivacyBudgetRecord *)self setObjectId:v8];
  }

  return isKindOfClass & 1;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (double)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(double)a3
{
  self->_lastUpdate = a3;
}

- (int64_t)balance
{
  return self->_balance;
}

- (void)setBalance:(int64_t)a3
{
  self->_balance = a3;
}

- (double)cohortAggregateBalance
{
  return self->_cohortAggregateBalance;
}

- (void)setCohortAggregateBalance:(double)a3
{
  self->_cohortAggregateBalance = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (NSManagedObjectID)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end