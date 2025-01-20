@interface _DPBitValueRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBitValueRecord:(id)a3;
- (BOOL)submitted;
- (NSManagedObjectID)objectId;
- (NSString)key;
- (NSString)privateBitValueStr;
- (_DPBitValueRecord)init;
- (_DPBitValueRecord)initWithCoder:(id)a3;
- (_DPBitValueRecord)initWithKey:(id)a3 clearBitValue:(signed __int16)a4 privateBitValueStr:(id)a5 creationDate:(double)a6 submitted:(BOOL)a7 objectId:(id)a8;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityName;
- (id)jsonString;
- (int64_t)reportVersion;
- (signed)clearBitValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClearBitValue:(signed __int16)a3;
- (void)setCreationDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setPrivateBitValueStr:(id)a3;
- (void)setReportVersion:(int64_t)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPBitValueRecord

- (_DPBitValueRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPBitValueRecord *)self initWithKey:@"com.apple._DPBitValueDataRecord" clearBitValue:0 privateBitValueStr:&stru_1F3681BE0 creationDate:0 submitted:0 objectId:v5];
}

- (_DPBitValueRecord)initWithKey:(id)a3 clearBitValue:(signed __int16)a4 privateBitValueStr:(id)a5 creationDate:(double)a6 submitted:(BOOL)a7 objectId:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_DPBitValueRecord;
  v17 = [(_DPBitValueRecord *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_key, a3);
    v18->_clearBitValue = 0;
    objc_storeStrong((id *)&v18->_privateBitValueStr, a5);
    v18->_creationDate = a6;
    v18->_submitted = a7;
    v18->_reportVersion = +[_DPJSONOutputHelper currentVersion];
    objc_storeStrong((id *)&v18->_objectId, a8);
  }

  return v18;
}

- (id)jsonString
{
  v2 = NSString;
  v3 = [(_DPBitValueRecord *)self privateBitValueStr];
  double v4 = [v2 stringWithFormat:@"\"%@\"", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPBitValueRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clearBitValue"];
  uint64_t v7 = [v6 shortValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateBitValueStr"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitted"];

  uint64_t v13 = [v12 BOOLValue];
  id v14 = [(_DPBitValueRecord *)self initWithKey:v5 clearBitValue:v7 privateBitValueStr:v8 creationDate:v13 submitted:0 objectId:v11];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeObject:self->_key forKey:@"key"];
  id v4 = [NSNumber numberWithShort:self->_clearBitValue];
  [v9 encodeObject:v4 forKey:@"clearBitValue"];

  [v9 encodeObject:self->_privateBitValueStr forKey:@"privateBitValueStr"];
  double v5 = [NSNumber numberWithDouble:self->_creationDate];
  [v9 encodeObject:v5 forKey:@"creationDate"];

  v6 = [NSNumber numberWithBool:self->_submitted];
  [v9 encodeObject:v6 forKey:@"submitted"];

  uint64_t v7 = [NSNumber numberWithLongLong:self->_reportVersion];
  [v9 encodeObject:v7 forKey:@"reportVersion"];

  objectId = self->_objectId;
  if (objectId) {
    [v9 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  id v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  double v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { key=%@ ; ", v6, self->_key];

  uint64_t v7 = "YES";
  if (!self->_submitted) {
    uint64_t v7 = "NO";
  }
  objc_msgSend(v4, "appendFormat:", @"privateBitValueStr=%@ ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; ",
    self->_privateBitValueStr,
    *(void *)&self->_creationDate,
    v7,
    self->_reportVersion);
  if (self->_objectId) {
    [v4 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v4 appendString:@"objectId=(nil) }"];
  }
  v8 = (void *)[v4 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = [(_DPBitValueRecord *)self key];
  uint64_t v6 = [(_DPBitValueRecord *)self clearBitValue];
  uint64_t v7 = [(_DPBitValueRecord *)self privateBitValueStr];
  [(_DPBitValueRecord *)self creationDate];
  double v9 = v8;
  BOOL v10 = [(_DPBitValueRecord *)self submitted];
  double v11 = [(_DPBitValueRecord *)self objectId];
  v12 = (void *)[v4 initWithKey:v5 clearBitValue:v6 privateBitValueStr:v7 creationDate:v10 submitted:v11 objectId:v9];

  return v12;
}

- (BOOL)isEqualToBitValueRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  double v5 = [(_DPBitValueRecord *)self key];
  uint64_t v6 = [v4 key];
  int v27 = [v5 isEqualToString:v6];

  int v26 = [(_DPBitValueRecord *)self clearBitValue];
  int v7 = [v4 clearBitValue];
  double v8 = [(_DPBitValueRecord *)self privateBitValueStr];
  uint64_t v9 = [v4 privateBitValueStr];
  int v10 = [v8 isEqualToString:v9];

  [(_DPBitValueRecord *)self creationDate];
  double v12 = v11;
  [v4 creationDate];
  BOOL v14 = areEqualTimeIntervals(v12, v13);
  LODWORD(v9) = [(_DPBitValueRecord *)self submitted];
  int v15 = v9 ^ [v4 submitted];
  int64_t v16 = [(_DPBitValueRecord *)self reportVersion];
  uint64_t v17 = [v4 reportVersion];
  v18 = [(_DPBitValueRecord *)self objectId];

  if (v18)
  {
    v19 = [(_DPBitValueRecord *)self objectId];
    objc_super v20 = [v4 objectId];
    char v21 = [v19 isEqual:v20];
  }
  else
  {
    v22 = [v4 objectId];

    char v21 = v22 == 0;
  }
  int v23 = v27 ^ 1;
  if (v26 != v7) {
    int v23 = 1;
  }
  if (((v23 | v10 ^ 1 | !v14 | v15) & 1) == 0)
  {
    if (v16 == v17) {
      BOOL v24 = v21;
    }
    else {
      BOOL v24 = 0;
    }
  }
  else
  {
LABEL_8:
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPBitValueRecord *)a3;
  double v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPBitValueRecord *)self isEqualToBitValueRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPBitValueRecord *)self key];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(_DPBitValueRecord *)self clearBitValue];
  BOOL v6 = [(_DPBitValueRecord *)self privateBitValueStr];
  uint64_t v7 = v5 ^ [v6 hash];
  [(_DPBitValueRecord *)self creationDate];
  unint64_t v9 = (unint64_t)v8;
  uint64_t v10 = v7 ^ [(_DPBitValueRecord *)self submitted];
  int64_t v11 = v10 ^ [(_DPBitValueRecord *)self reportVersion];
  double v12 = [(_DPBitValueRecord *)self objectId];
  unint64_t v13 = v11 ^ [v12 hash] ^ v9;

  return v13;
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
  return @"BitValueRecord";
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
    uint64_t v7 = [(_DPBitValueRecord *)self key];
    [v6 setKey:v7];

    objc_msgSend(v6, "setClearBitValue:", -[_DPBitValueRecord clearBitValue](self, "clearBitValue"));
    double v8 = [(_DPBitValueRecord *)self privateBitValueStr];
    [v6 setPrivateBitValueStr:v8];

    [(_DPBitValueRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPBitValueRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPBitValueRecord reportVersion](self, "reportVersion"));
    unint64_t v9 = [(_DPBitValueRecord *)self objectId];
    uint64_t v10 = [v6 objectID];

    if (v9 != v10)
    {
      int64_t v11 = [v6 objectID];
      [(_DPBitValueRecord *)self setObjectId:v11];
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
    uint64_t v7 = [v6 key];
    [(_DPBitValueRecord *)self setKey:v7];

    -[_DPBitValueRecord setClearBitValue:](self, "setClearBitValue:", [v6 clearBitValue]);
    double v8 = [v6 privateBitValueStr];
    [(_DPBitValueRecord *)self setPrivateBitValueStr:v8];

    [v6 creationDate];
    -[_DPBitValueRecord setCreationDate:](self, "setCreationDate:");
    -[_DPBitValueRecord setSubmitted:](self, "setSubmitted:", [v6 submitted]);
    -[_DPBitValueRecord setReportVersion:](self, "setReportVersion:", [v6 reportVersion]);
    unint64_t v9 = [v6 objectID];

    [(_DPBitValueRecord *)self setObjectId:v9];
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

- (signed)clearBitValue
{
  return self->_clearBitValue;
}

- (void)setClearBitValue:(signed __int16)a3
{
  self->_clearBitValue = a3;
}

- (NSString)privateBitValueStr
{
  return self->_privateBitValueStr;
}

- (void)setPrivateBitValueStr:(id)a3
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
  objc_storeStrong((id *)&self->_privateBitValueStr, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end