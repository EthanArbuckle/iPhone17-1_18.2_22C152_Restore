@interface _DKObject
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
+ (id)fetchObjectWithUUID:(id)a3 context:(id)a4;
+ (id)fromPBCodable:(id)a3;
+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6;
- (BOOL)BOOLValue;
- (BOOL)copyBaseObjectInfoFromManagedObject:(id)a3 cache:(id)a4;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSString)description;
- (NSUUID)UUID;
- (_DKObject)init;
- (_DKObject)initWithCoder:(id)a3;
- (_DKSource)source;
- (double)doubleValue;
- (id)entityName;
- (id)stringValue;
- (id)toPBCodable;
- (int64_t)integerValue;
- (int64_t)typeCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setLocalCreationDate:(id)a3;
- (void)setSource:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation _DKObject

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_localCreationDate forKey:@"localCreationDate"];
}

- (_DKSource)source
{
  return (_DKSource *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (_DKObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKObject;
  return [(_DKObject *)&v3 init];
}

- (void)setUUID:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalCreationDate:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)localCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

+ (id)fetchObjectWithUUID:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55___DKObject_MOConversion__fetchObjectWithUUID_context___block_invoke;
  v11[3] = &unk_1E560E960;
  id v7 = v6;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  v14 = &v15;
  [v7 performWithOptions:4 andBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)toPBCodable
{
  return 0;
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = -[_DKPRValue type]((uint64_t)v4);
    unsigned int v6 = -[_DKPRValueType type]((uint64_t)v5);

    if (v6 > 2)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [(__objc2_class *)*off_1E560F020[v6] fromPBCodable:v4];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_DKObject;
  id v5 = [(_DKObject *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (_DKSource *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localCreationDate"];
    localCreationDate = v5->_localCreationDate;
    v5->_localCreationDate = (NSDate *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSString)description
{
  if (self->_creationDate || self->_localCreationDate)
  {
    id v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = [(NSUUID *)self->_UUID UUIDString];
    objc_msgSend(v3, "stringWithFormat:", @"%@: { UUID=%@; source=%@; creationDate=%@, localCreationDate=%@ }",
      v5,
      v6,
      self->_source,
      self->_creationDate,
      self->_localCreationDate);
  }
  else
  {
    id v9 = NSString;
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v10);
    uint64_t v6 = [(NSUUID *)self->_UUID UUIDString];
    [v9 stringWithFormat:@"%@: { UUID=%@; source=%@; }", v5, v6, self->_source, v11, v12];
  id v7 = };

  return (NSString *)v7;
}

- (BOOL)BOOLValue
{
  return [(_DKObject *)self integerValue] != 0;
}

- (int64_t)integerValue
{
  [(_DKObject *)self doubleValue];
  return (uint64_t)v2;
}

- (double)doubleValue
{
  return 0.0;
}

- (id)stringValue
{
  if ([(_DKObject *)self conformsToProtocol:&unk_1EDE263C0])
  {
    id v3 = [(_DKObject *)self primaryValue];
    id v4 = [v3 description];
  }
  else
  {
    id v4 = [(_DKObject *)self description];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (_DKObject *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        uint64_t v8 = [(_DKObject *)self source];
        id v9 = [(_DKObject *)v7 source];
        if (v8 != v9)
        {
          uint64_t v10 = [(_DKObject *)self source];
          id v3 = [(_DKObject *)v7 source];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
LABEL_14:

LABEL_15:
            goto LABEL_16;
          }
          uint64_t v17 = v10;
        }
        uint64_t v12 = [(_DKObject *)self UUID];
        id v13 = [(_DKObject *)v7 UUID];
        if (v12 == v13)
        {
          char v11 = 1;
        }
        else
        {
          v14 = [(_DKObject *)self UUID];
          uint64_t v15 = [(_DKObject *)v7 UUID];
          char v11 = [v14 isEqual:v15];
        }
        uint64_t v10 = v17;
        if (v8 == v9) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

+ (id)entityName
{
  return @"Object";
}

- (id)entityName
{
  double v2 = objc_opt_class();
  return (id)[v2 entityName];
}

- (int64_t)typeCode
{
  return 0;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  BOOL v25 = a4;
  v32[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a5;
  id v9 = a6;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  char v11 = v8;
  uint64_t v12 = [v8 entity];
  id v13 = [v12 name];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v20 = [v19 entityName];
        int v21 = [v13 isEqualToString:v20];

        if (v21)
        {
          uint64_t v22 = [v19 objectFromManagedObject:v11 readMetadata:v25 excludedMetadataKeys:v26 cache:v9];
          if (v22)
          {
            v23 = (void *)v22;
            goto LABEL_12;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_17;
  }
  id v6 = v4;
  id v7 = [(_DKObject *)self UUID];
  id v8 = [v7 UUIDString];
  [v6 setUuid:v8];

  id v9 = NSNumber;
  uint64_t v10 = [v6 uuid];
  char v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
  [v6 setUuidHash:v11];

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v13 = [(_DKObject *)self creationDate];
  id v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (void *)v13;
  }
  else {
    uint64_t v15 = v12;
  }
  [v6 setCreationDate:v15];

  [v6 setLocalCreationDate:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v6;
    uint64_t v17 = [v16 streamName];
    if ([v17 isEqualToString:@"/device/isPluggedIn"])
    {
      v18 = [v16 creationDate];
      [v18 timeIntervalSinceReferenceDate];
      double v20 = v19;
      [v16 endDate];
      double v22 = v20 - v21;

      if (v22 < 0.0) {
        double v22 = -v22;
      }

      if (v22 <= 3600.0) {
        goto LABEL_13;
      }
      uint64_t v17 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        [(_DKObject(MOConversion) *)v16 copyToManagedObject:v17];
      }
    }

LABEL_13:
  }
  v23 = [(_DKObject *)self source];

  if (v23)
  {
    v24 = [(_DKObject *)self source];
    BOOL v25 = [v6 managedObjectContext];
    id v26 = +[_DKSourceMOConverter insertSource:v24 inManagedObjectContext:v25];
    [v6 setSource:v26];
  }
LABEL_17:

  return isKindOfClass & 1;
}

- (BOOL)copyBaseObjectInfoFromManagedObject:(id)a3 cache:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v7 = v5;
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = [v7 uuid];
    uint64_t v10 = (void *)[v8 initWithUUIDString:v9];
    [(_DKObject *)self setUUID:v10];

    char v11 = [v7 source];

    if (v11)
    {
      uint64_t v12 = [v7 source];
      uint64_t v13 = +[_DKSourceMOConverter sourceFromManagedObject:v12];
      [(_DKObject *)self setSource:v13];
    }
    id v14 = [v7 creationDate];
    [(_DKObject *)self setCreationDate:v14];

    uint64_t v15 = [v7 localCreationDate];
    [(_DKObject *)self setLocalCreationDate:v15];
  }
  return isKindOfClass & 1;
}

@end