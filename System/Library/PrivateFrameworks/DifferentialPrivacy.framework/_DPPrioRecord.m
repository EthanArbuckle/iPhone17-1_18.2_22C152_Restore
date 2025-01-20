@interface _DPPrioRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPrioRecord:(id)a3;
- (BOOL)submitted;
- (NSData)share1;
- (NSData)share2;
- (NSDictionary)metadata;
- (NSManagedObjectID)objectId;
- (NSString)description;
- (NSString)key;
- (_DPPrioRecord)init;
- (_DPPrioRecord)initWithCoder:(id)a3;
- (_DPPrioRecord)initWithKey:(id)a3 share1:(id)a4 share2:(id)a5 dimension:(int64_t)a6 metadata:(id)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entityName;
- (id)jsonString;
- (int64_t)dimension;
- (int64_t)reportVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setDimension:(int64_t)a3;
- (void)setKey:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setReportVersion:(int64_t)a3;
- (void)setShare1:(id)a3;
- (void)setShare2:(id)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPPrioRecord

- (_DPPrioRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  v6 = [MEMORY[0x1E4F1C9B8] data];
  v7 = [MEMORY[0x1E4F1C9B8] data];
  v8 = [(_DPPrioRecord *)self initWithKey:@"com.apple._DPPrioRecord" share1:v6 share2:v7 dimension:0 metadata:MEMORY[0x1E4F1CC08] creationDate:0 submitted:v5 objectId:0];

  return v8;
}

- (_DPPrioRecord)initWithKey:(id)a3 share1:(id)a4 share2:(id)a5 dimension:(int64_t)a6 metadata:(id)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a10;
  v32.receiver = self;
  v32.super_class = (Class)_DPPrioRecord;
  v22 = [(_DPPrioRecord *)&v32 init];
  if (v22)
  {
    uint64_t v23 = [v17 copy];
    key = v22->_key;
    v22->_key = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    share1 = v22->_share1;
    v22->_share1 = (NSData *)v25;

    uint64_t v27 = [v19 copy];
    share2 = v22->_share2;
    v22->_share2 = (NSData *)v27;

    v22->_dimension = a6;
    uint64_t v29 = [v20 copy];
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v29;

    v22->_creationDate = a8;
    v22->_submitted = a9;
    v22->_reportVersion = +[_DPJSONOutputHelper currentVersion];
    objc_storeStrong((id *)&v22->_objectId, a10);
  }

  return v22;
}

- (id)jsonString
{
  return (id)[NSString stringWithFormat:@"{\"share1\":\"%@\",\"share2\":\"%@\",\"dimension\":\"%lld\"}", self->_share1, self->_share2, self->_dimension];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPPrioRecord)initWithCoder:(id)a3
{
  id v3 = a3;
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  double v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"share1"];
  double v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"share2"];
  uint64_t v20 = [v3 decodeInt64ForKey:@"dimension"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = [v3 decodeObjectOfClasses:v11 forKey:@"metadata"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"submitted"];

  uint64_t v17 = [v16 BOOLValue];
  id v18 = [(_DPPrioRecord *)self initWithKey:v21 share1:v4 share2:v5 dimension:v20 metadata:v12 creationDate:v17 submitted:v15 objectId:0];

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_key forKey:@"key"];
  [v8 encodeObject:self->_share1 forKey:@"share1"];
  [v8 encodeObject:self->_share2 forKey:@"share2"];
  [v8 encodeInt64:self->_dimension forKey:@"dimension"];
  [v8 encodeObject:self->_metadata forKey:@"metadata"];
  double v4 = [NSNumber numberWithDouble:self->_creationDate];
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

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E019F810](self, a2);
  double v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  double v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { key=%@ ; ", v6, self->_key];

  NSUInteger v7 = [(NSData *)self->_share1 length];
  NSUInteger v8 = [(NSData *)self->_share2 length];
  double creationDate = self->_creationDate;
  if (self->_submitted) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  int64_t reportVersion = self->_reportVersion;
  int64_t dimension = self->_dimension;
  v13 = [(NSDictionary *)self->_metadata allKeys];
  objc_msgSend(v4, "appendFormat:", @"share1=(length:%lu) ; share2=(length:%lu) ; dimension=%lld ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; metadata=(keys: %@) ; ",
    v7,
    v8,
    dimension,
    *(void *)&creationDate,
    v10,
    reportVersion,
    v13);

  if (self->_objectId) {
    [v4 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v4 appendString:@"objectId=(nil) }"];
  }
  double v14 = (void *)[v4 copy];

  return (NSString *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = [(_DPPrioRecord *)self key];
  v6 = [(_DPPrioRecord *)self share1];
  NSUInteger v7 = [(_DPPrioRecord *)self share2];
  int64_t v8 = [(_DPPrioRecord *)self dimension];
  uint64_t v9 = [(_DPPrioRecord *)self metadata];
  [(_DPPrioRecord *)self creationDate];
  double v11 = v10;
  BOOL v12 = [(_DPPrioRecord *)self submitted];
  v13 = [(_DPPrioRecord *)self objectId];
  double v14 = (void *)[v4 initWithKey:v5 share1:v6 share2:v7 dimension:v8 metadata:v9 creationDate:v12 submitted:v11 objectId:v13];

  return v14;
}

- (BOOL)isEqualToPrioRecord:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
LABEL_14:
    BOOL v39 = 0;
    goto LABEL_18;
  }
  v6 = [(_DPPrioRecord *)self key];
  NSUInteger v7 = [v5 key];
  int v8 = [v6 isEqualToString:v7];

  share1 = self->_share1;
  double v10 = [v5 share1];
  int v43 = v8;
  if (share1 != v10)
  {
    double v11 = self->_share1;
    id v3 = [v5 share1];
    if (![(NSData *)v11 isEqualToData:v3])
    {
      int v12 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  share2 = self->_share2;
  double v14 = [v5 share2];
  if (share2 == v14)
  {
    int v12 = 1;
  }
  else
  {
    double v15 = self->_share2;
    v16 = [v5 share2];
    int v12 = [(NSData *)v15 isEqualToData:v16];
  }
  if (share1 != v10) {
    goto LABEL_9;
  }
LABEL_10:

  int64_t v17 = [(_DPPrioRecord *)self dimension];
  uint64_t v18 = [v5 dimension];
  id v19 = [(_DPPrioRecord *)self metadata];
  uint64_t v20 = [v5 metadata];
  char v42 = [v19 isEqualToDictionary:v20];

  [(_DPPrioRecord *)self creationDate];
  double v22 = v21;
  [v5 creationDate];
  BOOL v24 = areEqualTimeIntervals(v22, v23);
  LODWORD(v20) = [(_DPPrioRecord *)self submitted];
  int v25 = v20 ^ [v5 submitted];
  int64_t v26 = [(_DPPrioRecord *)self reportVersion];
  uint64_t v27 = [v5 reportVersion];
  v28 = [(_DPPrioRecord *)self objectId];

  if (v28)
  {
    uint64_t v29 = [(_DPPrioRecord *)self objectId];
    [v5 objectId];
    char v30 = v25;
    BOOL v31 = v24;
    uint64_t v32 = v27;
    int64_t v33 = v26;
    uint64_t v34 = v18;
    int64_t v35 = v17;
    v37 = int v36 = v12;
    char v41 = [v29 isEqual:v37];

    int v12 = v36;
    int64_t v17 = v35;
    uint64_t v18 = v34;
    int64_t v26 = v33;
    uint64_t v27 = v32;
    BOOL v24 = v31;
    LOBYTE(v25) = v30;
  }
  else
  {
    v38 = [v5 objectId];

    char v41 = v38 == 0;
  }
  if ((v17 != v18 || (v43 & v12 & 1) == 0 || (v42 & 1) == 0 || !v24) | v25 & 1) {
    goto LABEL_14;
  }
  if (v26 == v27) {
    BOOL v39 = v41;
  }
  else {
    BOOL v39 = 0;
  }
LABEL_18:

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPPrioRecord *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPPrioRecord *)self isEqualToPrioRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [(_DPPrioRecord *)self key];
  uint64_t v4 = [v3 hash];
  id v5 = [(_DPPrioRecord *)self share1];
  uint64_t v6 = [v5 hash] ^ v4;
  NSUInteger v7 = [(_DPPrioRecord *)self share2];
  uint64_t v8 = [v7 hash];
  int64_t v9 = v6 ^ v8 ^ [(_DPPrioRecord *)self dimension];
  double v10 = [(_DPPrioRecord *)self metadata];
  uint64_t v11 = v9 ^ [v10 hash];
  [(_DPPrioRecord *)self creationDate];
  unint64_t v13 = (unint64_t)v12;
  uint64_t v14 = v11 ^ [(_DPPrioRecord *)self submitted];
  int64_t v15 = v14 ^ [(_DPPrioRecord *)self reportVersion];
  v16 = [(_DPPrioRecord *)self objectId];
  unint64_t v17 = v15 ^ [v16 hash] ^ v13;

  return v17;
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
  return @"PrioRecord";
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
    NSUInteger v7 = [(_DPPrioRecord *)self key];
    [v6 setKey:v7];

    uint64_t v8 = [(_DPPrioRecord *)self share1];
    [v6 setShare1:v8];

    int64_t v9 = [(_DPPrioRecord *)self share2];
    [v6 setShare2:v9];

    objc_msgSend(v6, "setDimension:", -[_DPPrioRecord dimension](self, "dimension"));
    double v10 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v11 = [(_DPPrioRecord *)self metadata];
    id v19 = 0;
    double v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v19];
    id v13 = v19;

    if (v13)
    {
      uint64_t v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioRecord copyToManagedObject:]((uint64_t)v13, v14);
      }
    }
    [v6 setMetadata:v12];
    [(_DPPrioRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPPrioRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPPrioRecord reportVersion](self, "reportVersion"));
    int64_t v15 = [(_DPPrioRecord *)self objectId];
    v16 = [v6 objectID];

    if (v15 != v16)
    {
      unint64_t v17 = [v6 objectID];
      [(_DPPrioRecord *)self setObjectId:v17];
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
    NSUInteger v7 = [v6 key];
    [(_DPPrioRecord *)self setKey:v7];

    uint64_t v8 = [v6 share1];
    [(_DPPrioRecord *)self setShare1:v8];

    int64_t v9 = [v6 share2];
    [(_DPPrioRecord *)self setShare2:v9];

    -[_DPPrioRecord setDimension:](self, "setDimension:", [v6 dimension]);
    double v10 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v11 = _DPMetadataExpectedClasses();
    double v12 = [v6 metadata];
    id v18 = 0;
    id v13 = [v10 unarchivedObjectOfClasses:v11 fromData:v12 error:&v18];
    id v14 = v18;

    if (v14)
    {
      int64_t v15 = +[_DPLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioRecord copyFromManagedObject:]((uint64_t)v14, v15);
      }
    }
    [(_DPPrioRecord *)self setMetadata:v13];
    [v6 creationDate];
    -[_DPPrioRecord setCreationDate:](self, "setCreationDate:");
    -[_DPPrioRecord setSubmitted:](self, "setSubmitted:", [v6 submitted]);
    -[_DPPrioRecord setReportVersion:](self, "setReportVersion:", [v6 reportVersion]);
    v16 = [v6 objectID];
    [(_DPPrioRecord *)self setObjectId:v16];
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

- (NSData)share1
{
  return self->_share1;
}

- (void)setShare1:(id)a3
{
}

- (NSData)share2
{
  return self->_share2;
}

- (void)setShare2:(id)a3
{
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (void)setDimension:(int64_t)a3
{
  self->_int64_t dimension = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_double creationDate = a3;
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
  self->_int64_t reportVersion = a3;
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
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_share2, 0);
  objc_storeStrong((id *)&self->_share1, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)copyToManagedObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Unable to securely archive metadata Dictionary! error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)copyFromManagedObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Unable to securely unarchive metadata Dictionary! error: %@", (uint8_t *)&v2, 0xCu);
}

@end