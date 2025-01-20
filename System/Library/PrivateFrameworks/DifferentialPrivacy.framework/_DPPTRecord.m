@interface _DPPTRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPTRecord:(id)a3;
- (BOOL)submitted;
- (NSManagedObjectID)objectId;
- (NSString)key;
- (NSString)privateValue;
- (_DPPTRecord)init;
- (_DPPTRecord)initWithCoder:(id)a3;
- (_DPPTRecord)initWithKey:(id)a3 privateValue:(id)a4 creationDate:(double)a5 submitted:(BOOL)a6 objectId:(id)a7;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityName;
- (id)jsonString;
- (int64_t)reportVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setPrivateValue:(id)a3;
- (void)setReportVersion:(int64_t)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPPTRecord

- (_DPPTRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPPTRecord *)self initWithKey:@"com.apple._DPPTRecord" privateValue:&stru_1F3681BE0 creationDate:0 submitted:0 objectId:v5];
}

- (_DPPTRecord)initWithKey:(id)a3 privateValue:(id)a4 creationDate:(double)a5 submitted:(BOOL)a6 objectId:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_DPPTRecord;
  v16 = [(_DPPTRecord *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    uint64_t v18 = [v14 copy];
    privateValue = v17->_privateValue;
    v17->_privateValue = (NSString *)v18;

    v17->_creationDate = a5;
    v17->_submitted = a6;
    v17->_reportVersion = +[_DPJSONOutputHelper currentVersion];
    objc_storeStrong((id *)&v17->_objectId, a7);
  }

  return v17;
}

- (id)jsonString
{
  v2 = NSString;
  v3 = [(_DPPTRecord *)self privateValue];
  double v4 = [v2 stringWithFormat:@"\"%@\"", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPPTRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitted"];

  uint64_t v11 = [v10 BOOLValue];
  v12 = [(_DPPTRecord *)self initWithKey:v5 privateValue:v6 creationDate:v11 submitted:0 objectId:v9];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_key forKey:@"key"];
  [v8 encodeObject:self->_privateValue forKey:@"privateValue"];
  id v4 = [NSNumber numberWithDouble:self->_creationDate];
  [v8 encodeObject:v4 forKey:@"creationDate"];

  double v5 = [NSNumber numberWithBool:self->_submitted];
  [v8 encodeObject:v5 forKey:@"submitted"];

  v6 = [NSNumber numberWithLongLong:self->_reportVersion];
  [v8 encodeObject:v6 forKey:@"reportVersion"];

  objectId = self->_objectId;
  if (objectId) {
    [v8 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  id v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  double v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { key=%@ ; ", v6, self->_key];

  v7 = "YES";
  if (!self->_submitted) {
    v7 = "NO";
  }
  objc_msgSend(v4, "appendFormat:", @"privateValue=%@ ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; ",
    self->_privateValue,
    *(void *)&self->_creationDate,
    v7,
    self->_reportVersion);
  if (self->_objectId) {
    [v4 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v4 appendString:@"objectId=(nil) }"];
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = [(_DPPTRecord *)self key];
  v6 = [(_DPPTRecord *)self privateValue];
  [(_DPPTRecord *)self creationDate];
  double v8 = v7;
  BOOL v9 = [(_DPPTRecord *)self submitted];
  v10 = [(_DPPTRecord *)self objectId];
  uint64_t v11 = (void *)[v4 initWithKey:v5 privateValue:v6 creationDate:v9 submitted:v10 objectId:v8];

  return v11;
}

- (BOOL)isEqualToPTRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  double v5 = [(_DPPTRecord *)self key];
  v6 = [v4 key];
  int v7 = [v5 isEqualToString:v6];

  double v8 = [(_DPPTRecord *)self privateValue];
  uint64_t v9 = [v4 privateValue];
  int v10 = [v8 isEqualToString:v9];

  [(_DPPTRecord *)self creationDate];
  double v12 = v11;
  [v4 creationDate];
  BOOL v14 = areEqualTimeIntervals(v12, v13);
  LODWORD(v9) = [(_DPPTRecord *)self submitted];
  int v15 = v9 ^ [v4 submitted];
  int64_t v16 = [(_DPPTRecord *)self reportVersion];
  uint64_t v17 = [v4 reportVersion];
  uint64_t v18 = [(_DPPTRecord *)self objectId];

  if (v18)
  {
    v19 = [(_DPPTRecord *)self objectId];
    v20 = [v4 objectId];
    char v21 = [v19 isEqual:v20];
  }
  else
  {
    v22 = [v4 objectId];

    char v21 = v22 == 0;
  }
  if (((v7 & v10 & v14 ^ 1 | v15) & 1) == 0)
  {
    if (v16 == v17) {
      BOOL v23 = v21;
    }
    else {
      BOOL v23 = 0;
    }
  }
  else
  {
LABEL_6:
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPPTRecord *)a3;
  double v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPPTRecord *)self isEqualToPTRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPPTRecord *)self key];
  uint64_t v4 = [v3 hash];
  double v5 = [(_DPPTRecord *)self privateValue];
  uint64_t v6 = [v5 hash] ^ v4;
  [(_DPPTRecord *)self creationDate];
  unint64_t v8 = (unint64_t)v7;
  uint64_t v9 = v6 ^ [(_DPPTRecord *)self submitted];
  int64_t v10 = v9 ^ [(_DPPTRecord *)self reportVersion];
  double v11 = [(_DPPTRecord *)self objectId];
  unint64_t v12 = v10 ^ [v11 hash] ^ v8;

  return v12;
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
  return @"PTRecord";
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
    double v7 = [(_DPPTRecord *)self key];
    [v6 setKey:v7];

    unint64_t v8 = [(_DPPTRecord *)self privateValue];
    [v6 setPrivateValue:v8];

    [(_DPPTRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPPTRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPPTRecord reportVersion](self, "reportVersion"));
    uint64_t v9 = [(_DPPTRecord *)self objectId];
    int64_t v10 = [v6 objectID];

    if (v9 != v10)
    {
      double v11 = [v6 objectID];
      [(_DPPTRecord *)self setObjectId:v11];
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
    [(_DPPTRecord *)self setKey:v7];

    unint64_t v8 = [v6 privateValue];
    [(_DPPTRecord *)self setPrivateValue:v8];

    [v6 creationDate];
    -[_DPPTRecord setCreationDate:](self, "setCreationDate:");
    -[_DPPTRecord setSubmitted:](self, "setSubmitted:", [v6 submitted]);
    -[_DPPTRecord setReportVersion:](self, "setReportVersion:", [v6 reportVersion]);
    uint64_t v9 = [v6 objectID];

    [(_DPPTRecord *)self setObjectId:v9];
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

- (NSString)privateValue
{
  return self->_privateValue;
}

- (void)setPrivateValue:(id)a3
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
  objc_storeStrong((id *)&self->_privateValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end