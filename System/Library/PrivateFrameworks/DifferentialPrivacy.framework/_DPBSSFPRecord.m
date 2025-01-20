@interface _DPBSSFPRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBSSFPRecord:(id)a3;
- (BOOL)submitted;
- (BOOL)verificationMode;
- (NSManagedObjectID)objectId;
- (NSString)key;
- (NSString)privateValue;
- (NSString)tableVersion;
- (_DPBSSFPRecord)init;
- (_DPBSSFPRecord)initWithCoder:(id)a3;
- (_DPBSSFPRecord)initWithKey:(id)a3 privateValue:(id)a4 tableVersion:(id)a5 segmentIndex:(int64_t)a6 verificationMode:(BOOL)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityName;
- (id)jsonString;
- (int64_t)reportVersion;
- (int64_t)segmentIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setPrivateValue:(id)a3;
- (void)setReportVersion:(int64_t)a3;
- (void)setSegmentIndex:(int64_t)a3;
- (void)setSubmitted:(BOOL)a3;
- (void)setTableVersion:(id)a3;
- (void)setVerificationMode:(BOOL)a3;
@end

@implementation _DPBSSFPRecord

- (_DPBSSFPRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPBSSFPRecord *)self initWithKey:@"com.apple._DPBSSFPRecord" privateValue:&stru_1F3681BE0 tableVersion:&stru_1F3681BE0 segmentIndex:0 verificationMode:0 creationDate:0 submitted:v5 objectId:0];
}

- (_DPBSSFPRecord)initWithKey:(id)a3 privateValue:(id)a4 tableVersion:(id)a5 segmentIndex:(int64_t)a6 verificationMode:(BOOL)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a10;
  v29.receiver = self;
  v29.super_class = (Class)_DPBSSFPRecord;
  v22 = [(_DPBSSFPRecord *)&v29 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_key, a3);
    uint64_t v24 = [v19 copy];
    privateValue = v23->_privateValue;
    v23->_privateValue = (NSString *)v24;

    uint64_t v26 = [v20 copy];
    tableVersion = v23->_tableVersion;
    v23->_tableVersion = (NSString *)v26;

    v23->_segmentIndex = a6;
    v23->_verificationMode = a7;
    v23->_creationDate = a8;
    v23->_submitted = a9;
    v23->_reportVersion = +[_DPJSONOutputHelper currentVersion];
    objc_storeStrong((id *)&v23->_objectId, a10);
  }

  return v23;
}

- (id)jsonString
{
  v3 = NSString;
  double v4 = [(_DPBSSFPRecord *)self tableVersion];
  BOOL v5 = [(_DPBSSFPRecord *)self verificationMode];
  int64_t v6 = [(_DPBSSFPRecord *)self segmentIndex];
  v7 = [(_DPBSSFPRecord *)self privateValue];
  v8 = [v3 stringWithFormat:@"\"%@;%d;%lld;%@\"", v4, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPBSSFPRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableVersion"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"segmentIndex"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verificationMode"];
  uint64_t v11 = [v10 BOOLValue];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitted"];

  uint64_t v16 = [v15 BOOLValue];
  v17 = [(_DPBSSFPRecord *)self initWithKey:v5 privateValue:v6 tableVersion:v7 segmentIndex:v9 verificationMode:v11 creationDate:v16 submitted:v14 objectId:0];

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_key forKey:@"key"];
  [v10 encodeObject:self->_privateValue forKey:@"privateValue"];
  [v10 encodeObject:self->_tableVersion forKey:@"tableVersion"];
  id v4 = [NSNumber numberWithInteger:self->_segmentIndex];
  [v10 encodeObject:v4 forKey:@"segmentIndex"];

  BOOL v5 = [NSNumber numberWithBool:self->_verificationMode];
  [v10 encodeObject:v5 forKey:@"verificationMode"];

  int64_t v6 = [NSNumber numberWithDouble:self->_creationDate];
  [v10 encodeObject:v6 forKey:@"creationDate"];

  v7 = [NSNumber numberWithBool:self->_submitted];
  [v10 encodeObject:v7 forKey:@"submitted"];

  v8 = [NSNumber numberWithLongLong:self->_reportVersion];
  [v10 encodeObject:v8 forKey:@"reportVersion"];

  objectId = self->_objectId;
  if (objectId) {
    [v10 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  id v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  BOOL v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { key=%@ ; ", v6, self->_key];

  v7 = "YES";
  if (self->_verificationMode) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  if (!self->_submitted) {
    v7 = "NO";
  }
  objc_msgSend(v4, "appendFormat:", @"privateValue=%@ ; tableVersion=%@ ; sergmentIndex=%lld ; verificationMode=%s ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; ",
    *(_OWORD *)&self->_privateValue,
    self->_segmentIndex,
    v8,
    *(void *)&self->_creationDate,
    v7,
    self->_reportVersion);
  if (self->_objectId) {
    [v4 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v4 appendString:@"objectId=(nil) }"];
  }
  uint64_t v9 = (void *)[v4 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL v5 = [(_DPBSSFPRecord *)self key];
  int64_t v6 = [(_DPBSSFPRecord *)self privateValue];
  v7 = [(_DPBSSFPRecord *)self tableVersion];
  int64_t v8 = [(_DPBSSFPRecord *)self segmentIndex];
  BOOL v9 = [(_DPBSSFPRecord *)self verificationMode];
  [(_DPBSSFPRecord *)self creationDate];
  double v11 = v10;
  BOOL v12 = [(_DPBSSFPRecord *)self submitted];
  double v13 = [(_DPBSSFPRecord *)self objectId];
  double v14 = (void *)[v4 initWithKey:v5 privateValue:v6 tableVersion:v7 segmentIndex:v8 verificationMode:v9 creationDate:v12 submitted:v11 objectId:v13];

  return v14;
}

- (BOOL)isEqualToBSSFPRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  BOOL v5 = [(_DPBSSFPRecord *)self key];
  int64_t v6 = [v4 key];
  int v37 = [v5 isEqualToString:v6];

  uint64_t v13 = [(_DPBSSFPRecord *)self privateValue];
  v7 = [v4 privateValue];
  int v8 = [(id)v13 isEqualToString:v7];

  BOOL v9 = [(_DPBSSFPRecord *)self tableVersion];
  double v10 = [v4 tableVersion];
  int v36 = [v9 isEqualToString:v10];

  int64_t v35 = [(_DPBSSFPRecord *)self segmentIndex];
  uint64_t v11 = [v4 segmentIndex];
  BOOL v12 = [(_DPBSSFPRecord *)self verificationMode];
  LODWORD(v13) = v12 ^ [v4 verificationMode];
  [(_DPBSSFPRecord *)self creationDate];
  double v15 = v14;
  [v4 creationDate];
  BOOL v17 = areEqualTimeIntervals(v15, v16);
  BOOL v18 = [(_DPBSSFPRecord *)self submitted];
  int v19 = v18 ^ [v4 submitted];
  int64_t v20 = [(_DPBSSFPRecord *)self reportVersion];
  uint64_t v21 = [v4 reportVersion];
  v22 = [(_DPBSSFPRecord *)self objectId];

  if (v22)
  {
    v23 = [(_DPBSSFPRecord *)self objectId];
    [v4 objectId];
    char v24 = v19;
    BOOL v25 = v17;
    uint64_t v26 = v21;
    char v27 = v13;
    uint64_t v13 = v11;
    int64_t v28 = v20;
    v30 = int v29 = v8;
    char v34 = [v23 isEqual:v30];

    int v8 = v29;
    int64_t v20 = v28;
    uint64_t v11 = v13;
    LOBYTE(v13) = v27;
    uint64_t v21 = v26;
    BOOL v17 = v25;
    LOBYTE(v19) = v24;
  }
  else
  {
    v31 = [v4 objectId];

    char v34 = v31 == 0;
  }
  if (!((v35 != v11 || (v37 & v8 & v36 & 1) == 0) | v13 & 1 | !v17 | v19 & 1))
  {
    if (v20 == v21) {
      BOOL v32 = v34;
    }
    else {
      BOOL v32 = 0;
    }
  }
  else
  {
LABEL_6:
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPBSSFPRecord *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPBSSFPRecord *)self isEqualToBSSFPRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPBSSFPRecord *)self key];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(_DPBSSFPRecord *)self privateValue];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(_DPBSSFPRecord *)self tableVersion];
  uint64_t v8 = [v7 hash];
  int64_t v9 = v6 ^ v8 ^ [(_DPBSSFPRecord *)self segmentIndex];
  int64_t v10 = v9 ^ [(_DPBSSFPRecord *)self verificationMode];
  [(_DPBSSFPRecord *)self creationDate];
  unint64_t v12 = (unint64_t)v11;
  int64_t v13 = v10 ^ [(_DPBSSFPRecord *)self submitted];
  int64_t v14 = v13 ^ [(_DPBSSFPRecord *)self reportVersion];
  double v15 = [(_DPBSSFPRecord *)self objectId];
  unint64_t v16 = v14 ^ [v15 hash] ^ v12;

  return v16;
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
  return @"BSSFPRecord";
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
    v7 = [(_DPBSSFPRecord *)self key];
    [v6 setKey:v7];

    uint64_t v8 = [(_DPBSSFPRecord *)self privateValue];
    [v6 setPrivateValue:v8];

    int64_t v9 = [(_DPBSSFPRecord *)self tableVersion];
    [v6 setTableVersion:v9];

    objc_msgSend(v6, "setSegmentIndex:", -[_DPBSSFPRecord segmentIndex](self, "segmentIndex"));
    objc_msgSend(v6, "setVerificationMode:", -[_DPBSSFPRecord verificationMode](self, "verificationMode"));
    [(_DPBSSFPRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPBSSFPRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPBSSFPRecord reportVersion](self, "reportVersion"));
    int64_t v10 = [(_DPBSSFPRecord *)self objectId];
    double v11 = [v6 objectID];

    if (v10 != v11)
    {
      unint64_t v12 = [v6 objectID];
      [(_DPBSSFPRecord *)self setObjectId:v12];
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
    v7 = [v6 key];
    [(_DPBSSFPRecord *)self setKey:v7];

    uint64_t v8 = [v6 privateValue];
    [(_DPBSSFPRecord *)self setPrivateValue:v8];

    int64_t v9 = [v6 tableVersion];
    [(_DPBSSFPRecord *)self setTableVersion:v9];

    -[_DPBSSFPRecord setSegmentIndex:](self, "setSegmentIndex:", [v6 segmentIndex]);
    -[_DPBSSFPRecord setVerificationMode:](self, "setVerificationMode:", [v6 verificationMode]);
    [v6 creationDate];
    -[_DPBSSFPRecord setCreationDate:](self, "setCreationDate:");
    -[_DPBSSFPRecord setSubmitted:](self, "setSubmitted:", [v6 submitted]);
    -[_DPBSSFPRecord setReportVersion:](self, "setReportVersion:", [v6 reportVersion]);
    int64_t v10 = [v6 objectID];

    [(_DPBSSFPRecord *)self setObjectId:v10];
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

- (NSString)tableVersion
{
  return self->_tableVersion;
}

- (void)setTableVersion:(id)a3
{
}

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (BOOL)verificationMode
{
  return self->_verificationMode;
}

- (void)setVerificationMode:(BOOL)a3
{
  self->_verificationMode = a3;
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
  objc_storeStrong((id *)&self->_tableVersion, 0);
  objc_storeStrong((id *)&self->_privateValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end