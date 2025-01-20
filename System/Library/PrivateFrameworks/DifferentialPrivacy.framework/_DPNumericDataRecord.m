@interface _DPNumericDataRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumericDataRecord:(id)a3;
- (BOOL)submitted;
- (NSManagedObjectID)objectId;
- (NSString)key;
- (_DPNumericDataRecord)init;
- (_DPNumericDataRecord)initWithCoder:(id)a3;
- (_DPNumericDataRecord)initWithKey:(id)a3 clearNumber:(double)a4 privateNumber:(double)a5 creationDate:(double)a6 submitted:(BOOL)a7 objectId:(id)a8;
- (double)clearNumber;
- (double)creationDate;
- (double)privateNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityName;
- (id)jsonString;
- (int64_t)reportVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClearNumber:(double)a3;
- (void)setCreationDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setPrivateNumber:(double)a3;
- (void)setReportVersion:(int64_t)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPNumericDataRecord

- (_DPNumericDataRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPNumericDataRecord *)self initWithKey:@"com.apple._DPNumericDataRecord" clearNumber:0 privateNumber:0 creationDate:0.0 submitted:0.0 objectId:v5];
}

- (_DPNumericDataRecord)initWithKey:(id)a3 clearNumber:(double)a4 privateNumber:(double)a5 creationDate:(double)a6 submitted:(BOOL)a7 objectId:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)_DPNumericDataRecord;
  v16 = [(_DPNumericDataRecord *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    v17->_clearNumber = 0.0;
    v17->_privateNumber = a5;
    v17->_creationDate = a6;
    v17->_submitted = a7;
    v17->_reportVersion = +[_DPJSONOutputHelper currentVersion];
    objc_storeStrong((id *)&v17->_objectId, a8);
  }

  return v17;
}

- (id)jsonString
{
  v2 = NSString;
  [(_DPNumericDataRecord *)self privateNumber];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"\"%lf\"", v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPNumericDataRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clearNumber"];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateNumber"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitted"];

  uint64_t v16 = [v15 BOOLValue];
  v17 = [(_DPNumericDataRecord *)self initWithKey:v5 clearNumber:v16 privateNumber:0 creationDate:v8 submitted:v11 objectId:v14];

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_key forKey:@"key"];
  id v4 = [NSNumber numberWithDouble:self->_clearNumber];
  [v10 encodeObject:v4 forKey:@"clearNumber"];

  double v5 = [NSNumber numberWithDouble:self->_privateNumber];
  [v10 encodeObject:v5 forKey:@"privateNumber"];

  v6 = [NSNumber numberWithDouble:self->_creationDate];
  [v10 encodeObject:v6 forKey:@"creationDate"];

  double v7 = [NSNumber numberWithBool:self->_submitted];
  [v10 encodeObject:v7 forKey:@"submitted"];

  double v8 = [NSNumber numberWithLongLong:self->_reportVersion];
  [v10 encodeObject:v8 forKey:@"reportVersion"];

  objectId = self->_objectId;
  if (objectId) {
    [v10 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E019F810](self, a2);
  id v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  double v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { key=%@ ; ", v6, self->_key];

  double v7 = "YES";
  if (!self->_submitted) {
    double v7 = "NO";
  }
  objc_msgSend(v4, "appendFormat:", @"privateNumber=%lf ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; ",
    *(void *)&self->_privateNumber,
    *(void *)&self->_creationDate,
    v7,
    self->_reportVersion);
  if (self->_objectId) {
    [v4 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v4 appendString:@"objectId=(nil) }"];
  }
  double v8 = (void *)[v4 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = [(_DPNumericDataRecord *)self key];
  [(_DPNumericDataRecord *)self clearNumber];
  double v7 = v6;
  [(_DPNumericDataRecord *)self privateNumber];
  double v9 = v8;
  [(_DPNumericDataRecord *)self creationDate];
  double v11 = v10;
  BOOL v12 = [(_DPNumericDataRecord *)self submitted];
  double v13 = [(_DPNumericDataRecord *)self objectId];
  double v14 = (void *)[v4 initWithKey:v5 clearNumber:v12 privateNumber:v13 creationDate:v7 submitted:v9 objectId:v11];

  return v14;
}

- (BOOL)isEqualToNumericDataRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_10;
  }
  double v5 = [(_DPNumericDataRecord *)self key];
  uint64_t v6 = [v4 key];
  int v7 = [v5 isEqualToString:v6];

  [(_DPNumericDataRecord *)self clearNumber];
  double v9 = v8;
  [v4 clearNumber];
  double v11 = vabdd_f64(v9, v10);
  [(_DPNumericDataRecord *)self privateNumber];
  double v13 = v12;
  [v4 privateNumber];
  double v15 = vabdd_f64(v13, v14);
  [(_DPNumericDataRecord *)self creationDate];
  double v17 = v16;
  [v4 creationDate];
  BOOL v19 = areEqualTimeIntervals(v17, v18);
  LODWORD(v6) = [(_DPNumericDataRecord *)self submitted];
  int v20 = v6 ^ [v4 submitted];
  int64_t v21 = [(_DPNumericDataRecord *)self reportVersion];
  uint64_t v22 = [v4 reportVersion];
  v23 = [(_DPNumericDataRecord *)self objectId];

  if (v23)
  {
    v24 = [(_DPNumericDataRecord *)self objectId];
    v25 = [v4 objectId];
    char v26 = [v24 isEqual:v25];
  }
  else
  {
    v27 = [v4 objectId];

    char v26 = v27 == 0;
  }
  int v28 = v7 ^ 1;
  if (v11 >= 1.0e-20) {
    int v28 = 1;
  }
  if (v15 >= 1.0e-20) {
    int v28 = 1;
  }
  if (((v28 | !v19 | v20) & 1) == 0)
  {
    if (v21 == v22) {
      BOOL v29 = v26;
    }
    else {
      BOOL v29 = 0;
    }
  }
  else
  {
LABEL_10:
    BOOL v29 = 0;
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPNumericDataRecord *)a3;
  double v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPNumericDataRecord *)self isEqualToNumericDataRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_DPNumericDataRecord *)self key];
  uint64_t v4 = [v3 hash];
  [(_DPNumericDataRecord *)self clearNumber];
  unint64_t v6 = v4 ^ (unint64_t)v5;
  [(_DPNumericDataRecord *)self privateNumber];
  unint64_t v8 = (unint64_t)v7;
  [(_DPNumericDataRecord *)self creationDate];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)v9;
  uint64_t v11 = [(_DPNumericDataRecord *)self submitted];
  int64_t v12 = v11 ^ [(_DPNumericDataRecord *)self reportVersion];
  double v13 = [(_DPNumericDataRecord *)self objectId];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
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
  return @"NumericDataRecord";
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
    double v7 = [(_DPNumericDataRecord *)self key];
    [v6 setKey:v7];

    [(_DPNumericDataRecord *)self clearNumber];
    objc_msgSend(v6, "setClearNumber:");
    [(_DPNumericDataRecord *)self privateNumber];
    objc_msgSend(v6, "setPrivateNumber:");
    [(_DPNumericDataRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPNumericDataRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPNumericDataRecord reportVersion](self, "reportVersion"));
    unint64_t v8 = [(_DPNumericDataRecord *)self objectId];
    double v9 = [v6 objectID];

    if (v8 != v9)
    {
      unint64_t v10 = [v6 objectID];
      [(_DPNumericDataRecord *)self setObjectId:v10];
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
    [(_DPNumericDataRecord *)self setKey:v7];

    [v6 clearNumber];
    -[_DPNumericDataRecord setClearNumber:](self, "setClearNumber:");
    [v6 privateNumber];
    -[_DPNumericDataRecord setPrivateNumber:](self, "setPrivateNumber:");
    [v6 creationDate];
    -[_DPNumericDataRecord setCreationDate:](self, "setCreationDate:");
    -[_DPNumericDataRecord setSubmitted:](self, "setSubmitted:", [v6 submitted]);
    -[_DPNumericDataRecord setReportVersion:](self, "setReportVersion:", [v6 reportVersion]);
    unint64_t v8 = [v6 objectID];

    [(_DPNumericDataRecord *)self setObjectId:v8];
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

- (double)clearNumber
{
  return self->_clearNumber;
}

- (void)setClearNumber:(double)a3
{
  self->_clearNumber = a3;
}

- (double)privateNumber
{
  return self->_privateNumber;
}

- (void)setPrivateNumber:(double)a3
{
  self->_privateNumber = a3;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (int64_t)reportVersion
{
  return self->_reportVersion;
}

- (void)setReportVersion:(int64_t)a3
{
  self->_reportVersion = a3;
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