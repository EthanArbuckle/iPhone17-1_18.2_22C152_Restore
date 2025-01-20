@interface _DPCMSRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCMSRecord:(id)a3;
- (BOOL)submitted;
- (NSManagedObjectID)objectId;
- (NSString)key;
- (_DPCMSRecord)init;
- (_DPCMSRecord)initWithCoder:(id)a3;
- (_DPCMSRecord)initWithKey:(id)a3 creationDate:(double)a4 submitted:(BOOL)a5 objectId:(id)a6;
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
- (void)setReportVersion:(int64_t)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPCMSRecord

- (_DPCMSRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPCMSRecord *)self initWithKey:@"UNKNOWN" creationDate:0 submitted:0 objectId:v5];
}

- (_DPCMSRecord)initWithKey:(id)a3 creationDate:(double)a4 submitted:(BOOL)a5 objectId:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_DPCMSRecord;
  v13 = [(_DPCMSRecord *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_creationDate = a4;
    v14->_submitted = a5;
    v14->_reportVersion = +[_DPJSONOutputHelper currentVersion];
    objc_storeStrong((id *)&v14->_objectId, a6);
  }

  return v14;
}

- (id)jsonString
{
  return &stru_1F3681BE0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPCMSRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitted"];

  uint64_t v10 = [v9 BOOLValue];
  id v11 = [(_DPCMSRecord *)self initWithKey:v5 creationDate:v10 submitted:0 objectId:v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  key = self->_key;
  if (key) {
    [v9 encodeObject:key forKey:@"key"];
  }
  double v5 = [NSNumber numberWithDouble:self->_creationDate];
  [v9 encodeObject:v5 forKey:@"creationDate"];

  v6 = [NSNumber numberWithBool:self->_submitted];
  [v9 encodeObject:v6 forKey:@"submitted"];

  double v7 = [NSNumber numberWithLongLong:self->_reportVersion];
  [v9 encodeObject:v7 forKey:@"reportVersion"];

  objectId = self->_objectId;
  if (objectId) {
    [v9 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_submitted) {
    double v7 = "YES";
  }
  else {
    double v7 = "NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"%@: { key=%@ ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; ",
    v5,
    self->_key,
    *(void *)&self->_creationDate,
    v7,
  double v8 = self->_reportVersion);

  if (self->_objectId) {
    [v8 appendFormat:@"objectId=%@ }", self->_objectId];
  }
  else {
    [v8 appendString:@"objectId=(nil) }"];
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(_DPCMSRecord *)self key];
  [(_DPCMSRecord *)self creationDate];
  double v7 = v6;
  BOOL v8 = [(_DPCMSRecord *)self submitted];
  id v9 = [(_DPCMSRecord *)self objectId];
  uint64_t v10 = (void *)[v4 initWithKey:v5 creationDate:v8 submitted:v9 objectId:v7];

  return v10;
}

- (BOOL)isEqualToCMSRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = [(_DPCMSRecord *)self key];
  uint64_t v6 = [v4 key];
  int v7 = [v5 isEqualToString:v6];

  [(_DPCMSRecord *)self creationDate];
  double v9 = v8;
  [v4 creationDate];
  BOOL v11 = areEqualTimeIntervals(v9, v10);
  LODWORD(v6) = [(_DPCMSRecord *)self submitted];
  int v12 = v6 ^ [v4 submitted];
  int64_t v13 = [(_DPCMSRecord *)self reportVersion];
  uint64_t v14 = [v4 reportVersion];
  v15 = [(_DPCMSRecord *)self objectId];

  if (v15)
  {
    objc_super v16 = [(_DPCMSRecord *)self objectId];
    v17 = [v4 objectId];
    char v18 = [v16 isEqual:v17];
  }
  else
  {
    v19 = [v4 objectId];

    char v18 = v19 == 0;
  }
  if (((v7 & v11 ^ 1 | v12) & 1) == 0)
  {
    if (v13 == v14) {
      BOOL v20 = v18;
    }
    else {
      BOOL v20 = 0;
    }
  }
  else
  {
LABEL_6:
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPCMSRecord *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPCMSRecord *)self isEqualToCMSRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPCMSRecord *)self key];
  uint64_t v4 = [v3 hash];
  [(_DPCMSRecord *)self creationDate];
  unint64_t v6 = (unint64_t)v5;
  uint64_t v7 = v4 ^ [(_DPCMSRecord *)self submitted];
  int64_t v8 = v7 ^ [(_DPCMSRecord *)self reportVersion];
  double v9 = [(_DPCMSRecord *)self objectId];
  unint64_t v10 = v8 ^ [v9 hash] ^ v6;

  return v10;
}

+ (id)createRecordFromManagedObject:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  double v5 = [v3 entity];
  unint64_t v6 = [v5 name];

  uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        int64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = [v13 entityName];
        int v15 = [v14 isEqualToString:v6];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
LABEL_12:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v24 != v19) {
        objc_enumerationMutation(v16);
      }
      v21 = objc_opt_new();
      if (objc_msgSend(v21, "copyFromManagedObject:", v3, v23)) {
        break;
      }

      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v18) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    v21 = 0;
  }

  return v21;
}

+ (id)entityName
{
  return @"CMSRecord";
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
    uint64_t v7 = [(_DPCMSRecord *)self key];
    [v6 setKey:v7];

    [(_DPCMSRecord *)self creationDate];
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPCMSRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPCMSRecord reportVersion](self, "reportVersion"));
    id v8 = [(_DPCMSRecord *)self objectId];
    uint64_t v9 = [v6 objectID];

    if (v8 != v9)
    {
      uint64_t v10 = [v6 objectID];
      [(_DPCMSRecord *)self setObjectId:v10];
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
    [(_DPCMSRecord *)self setKey:v7];

    [v6 creationDate];
    -[_DPCMSRecord setCreationDate:](self, "setCreationDate:");
    -[_DPCMSRecord setSubmitted:](self, "setSubmitted:", [v6 submitted]);
    -[_DPCMSRecord setReportVersion:](self, "setReportVersion:", [v6 reportVersion]);
    id v8 = [v6 objectID];

    [(_DPCMSRecord *)self setObjectId:v8];
  }

  return isKindOfClass & 1;
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

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
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