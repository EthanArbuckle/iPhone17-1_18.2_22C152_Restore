@interface _DPModelInfoRecord
+ (BOOL)supportsSecureCoding;
+ (id)createRecordFromManagedObject:(id)a3;
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelInfo:(id)a3;
- (BOOL)submitted;
- (NSManagedObjectID)objectId;
- (_DPModelInfoRecord)init;
- (_DPModelInfoRecord)initWithCoder:(id)a3;
- (_DPModelInfoRecord)initWithMajorVersion:(signed __int16)a3 minorVersion:(signed __int16)a4 creationDate:(double)a5 objectId:(id)a6;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityName;
- (signed)majorVersion;
- (signed)minorVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setMajorVersion:(signed __int16)a3;
- (void)setMinorVersion:(signed __int16)a3;
- (void)setObjectId:(id)a3;
- (void)setSubmitted:(BOOL)a3;
@end

@implementation _DPModelInfoRecord

- (_DPModelInfoRecord)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return [(_DPModelInfoRecord *)self initWithMajorVersion:0 minorVersion:0 creationDate:0 objectId:v5];
}

- (_DPModelInfoRecord)initWithMajorVersion:(signed __int16)a3 minorVersion:(signed __int16)a4 creationDate:(double)a5 objectId:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_DPModelInfoRecord;
  v12 = [(_DPModelInfoRecord *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_majorVersion = a3;
    v12->_minorVersion = a4;
    v12->_creationDate = a5;
    v12->_submitted = 0;
    objc_storeStrong((id *)&v12->_objectId, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPModelInfoRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorVersion"];
  uint64_t v6 = [v5 shortValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorVersion"];
  uint64_t v8 = [v7 shortValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];

  [v9 doubleValue];
  double v11 = v10;

  return [(_DPModelInfoRecord *)self initWithMajorVersion:v6 minorVersion:v8 creationDate:0 objectId:v11];
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [NSNumber numberWithShort:self->_majorVersion];
  [v8 encodeObject:v4 forKey:@"majorVersion"];

  double v5 = [NSNumber numberWithShort:self->_minorVersion];
  [v8 encodeObject:v5 forKey:@"minorVersion"];

  uint64_t v6 = [NSNumber numberWithDouble:self->_creationDate];
  [v8 encodeObject:v6 forKey:@"creationDate"];

  objectId = self->_objectId;
  if (objectId) {
    [v8 encodeObject:objectId forKey:@"objectId"];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { majorVersion=%d ; minorVersion=%d ; creationDate=%.16g ; ",
    v5,
    self->_majorVersion,
    self->_minorVersion,
  uint64_t v6 = *(void *)&self->_creationDate);

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
  uint64_t v5 = [(_DPModelInfoRecord *)self majorVersion];
  uint64_t v6 = [(_DPModelInfoRecord *)self minorVersion];
  [(_DPModelInfoRecord *)self creationDate];
  double v8 = v7;
  v9 = [(_DPModelInfoRecord *)self objectId];
  double v10 = (void *)[v4 initWithMajorVersion:v5 minorVersion:v6 creationDate:v9 objectId:v8];

  return v10;
}

- (BOOL)isEqualToModelInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  [(_DPModelInfoRecord *)self creationDate];
  double v6 = v5;
  [v4 creationDate];
  BOOL v8 = areEqualTimeIntervals(v6, v7);
  v9 = [(_DPModelInfoRecord *)self objectId];

  if (v9)
  {
    double v10 = [(_DPModelInfoRecord *)self objectId];
    double v11 = [v4 objectId];
    int v12 = [v10 isEqual:v11];
  }
  else
  {
    v13 = [v4 objectId];

    int v12 = v13 == 0;
  }
  if ((v8 & v12) == 1
    && (int v14 = [(_DPModelInfoRecord *)self majorVersion],
        v14 == [v4 majorVersion]))
  {
    int v15 = [(_DPModelInfoRecord *)self minorVersion];
    BOOL v16 = v15 == [v4 minorVersion];
  }
  else
  {
LABEL_8:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPModelInfoRecord *)a3;
  double v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPModelInfoRecord *)self isEqualToModelInfo:v5];

  return v6;
}

- (unint64_t)hash
{
  int v3 = [(_DPModelInfoRecord *)self majorVersion];
  uint64_t v4 = [(_DPModelInfoRecord *)self minorVersion] ^ v3;
  [(_DPModelInfoRecord *)self creationDate];
  unint64_t v6 = (unint64_t)v5;
  double v7 = [(_DPModelInfoRecord *)self objectId];
  unint64_t v8 = v4 ^ [v7 hash] ^ v6;

  return v8;
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
  return @"ModelInfoRecord";
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
    objc_msgSend(v6, "setMajorVersion:", -[_DPModelInfoRecord majorVersion](self, "majorVersion"));
    objc_msgSend(v6, "setMinorVersion:", -[_DPModelInfoRecord minorVersion](self, "minorVersion"));
    double v7 = [(_DPModelInfoRecord *)self objectId];
    unint64_t v8 = [v6 objectID];

    if (v7 != v8)
    {
      v9 = [v6 objectID];
      [(_DPModelInfoRecord *)self setObjectId:v9];
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
    -[_DPModelInfoRecord setMajorVersion:](self, "setMajorVersion:", [v6 majorVersion]);
    -[_DPModelInfoRecord setMinorVersion:](self, "setMinorVersion:", [v6 minorVersion]);
    double v7 = [v6 objectID];

    [(_DPModelInfoRecord *)self setObjectId:v7];
  }

  return isKindOfClass & 1;
}

- (signed)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(signed __int16)a3
{
  self->_majorVersion = a3;
}

- (signed)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(signed __int16)a3
{
  self->_minorVersion = a3;
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

- (NSManagedObjectID)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end