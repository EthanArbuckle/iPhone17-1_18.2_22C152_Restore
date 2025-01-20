@interface EKObjectID
+ (BOOL)supportsSecureCoding;
+ (EKObjectID)objectIDWithCADObjectID:(id)a3;
+ (EKObjectID)objectIDWithEntityType:(int)a3 rowID:(int)a4;
+ (EKObjectID)objectIDWithEntityType:(int)a3 rowID:(int)a4 databaseID:(int)a5;
+ (EKObjectID)objectIDWithURL:(id)a3;
+ (id)CADObjectIDsFromEKObjectIDs:(id)a3 withGeneration:(int)a4;
+ (id)EKObjectIDsFromCADObjectIDs:(id)a3;
+ (id)EKObjectIDsFromData:(id)a3;
+ (id)EKObjectIDsFromData:(id)a3 databaseID:(int)a4;
+ (id)EKObjectIDsFromData:(id)a3 range:(_NSRange)a4 databaseID:(int)a5;
+ (id)temporaryObjectIDWithEntityType:(int)a3;
+ (id)virtualObjectIDWithEntityType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporary;
- (BOOL)isVirtual;
- (CADObjectID)CADObjectID;
- (EKObjectID)initWithCoder:(id)a3;
- (EKObjectID)initWithDictionaryRepresentation:(id)a3;
- (EKObjectID)initWithEntityType:(int)a3 rowID:(int)a4 databaseID:(int)a5 temporary:(BOOL)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSString)entityName;
- (NSString)stringRepresentation;
- (NSURL)URIRepresentation;
- (id)CADObjectIDWithGeneration:(int)a3;
- (int)databaseID;
- (int)rowID;
- (int64_t)entityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKObjectID

- (BOOL)isEqual:(id)a3
{
  v4 = (EKObjectID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (Class = object_getClass(self), Class == object_getClass(v5)))
  {
    v8 = v5;
    BOOL v7 = self->_entityType == v8->_entityType
      && self->_rowID == v8->_rowID
      && self->_temporary == v8->_temporary
      && self->_databaseID == v8->_databaseID;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

- (id)CADObjectIDWithGeneration:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(EKObjectID *)self isVirtual])
  {
    uint64_t v5 = 0x7FFFFFFFLL;
  }
  else
  {
    unsigned int rowID = self->_rowID;
    if (self->_temporary) {
      uint64_t v5 = -rowID;
    }
    else {
      uint64_t v5 = rowID;
    }
  }
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F56990]) initWithEntityType:self->_entityType entityID:v5 databaseID:self->_databaseID generation:v3];

  return v7;
}

- (BOOL)isVirtual
{
  return self->_rowID == 0x7FFFFFFF;
}

- (unint64_t)hash
{
  return ((self->_temporary << 31) | ((self->_entityType & 0x7F) << 24) | self->_rowID & 0xFFFFFF) ^ (1327217884 * self->_databaseID);
}

- (int64_t)entityType
{
  return self->_entityType;
}

+ (EKObjectID)objectIDWithCADObjectID:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = objc_alloc((Class)a1);
    uint64_t v7 = [v5 entityType];
    int v8 = [v5 entityID];
    if (v8 >= 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = -v8;
    }
    uint64_t v10 = [v5 databaseID];
    uint64_t v11 = [v5 isTemporary];

    v12 = (void *)[v6 initWithEntityType:v7 rowID:v9 databaseID:v10 temporary:v11];
  }
  else
  {
    v12 = 0;
  }
  return (EKObjectID *)v12;
}

- (EKObjectID)initWithEntityType:(int)a3 rowID:(int)a4 databaseID:(int)a5 temporary:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)EKObjectID;
  result = [(EKObjectID *)&v11 init];
  if (result)
  {
    result->_entityType = a3;
    result->_unsigned int rowID = a4;
    result->_databaseID = a5;
    result->_temporary = a6;
  }
  return result;
}

+ (EKObjectID)objectIDWithEntityType:(int)a3 rowID:(int)a4 databaseID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  id v8 = objc_alloc((Class)a1);
  if (a4 >= 0) {
    uint64_t v9 = a4;
  }
  else {
    uint64_t v9 = -a4;
  }
  uint64_t v10 = (void *)[v8 initWithEntityType:v7 rowID:v9 databaseID:v5 temporary:a4 >> 31];

  return (EKObjectID *)v10;
}

+ (id)temporaryObjectIDWithEntityType:(int)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithEntityType:rowID:databaseID:temporary:", *(void *)&a3, atomic_fetch_add_explicit(temporaryObjectIDWithEntityType__sNextTempID, 1u, memory_order_relaxed), 0, 1);

  return v3;
}

- (NSString)entityName
{
  return (NSString *)MEMORY[0x1F410E768](self->_entityType, a2);
}

- (int)databaseID
{
  return self->_databaseID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (EKObjectID)objectIDWithEntityType:(int)a3 rowID:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc((Class)a1);
  if (a4 >= 0) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = -a4;
  }
  id v8 = (void *)[v6 initWithEntityType:v5 rowID:v7 databaseID:0 temporary:a4 >> 31];

  return (EKObjectID *)v8;
}

+ (id)virtualObjectIDWithEntityType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc((Class)a1);
  uint64_t v5 = (void *)[v4 initWithEntityType:v3 rowID:0x7FFFFFFFLL databaseID:*MEMORY[0x1E4F574B8] temporary:0];

  return v5;
}

+ (EKObjectID)objectIDWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scheme];
  char v6 = [v5 isEqualToString:@"x-apple-eventkit"];

  if (v6)
  {
    uint64_t v7 = [v4 host];
    if ([v7 length])
    {
      uint64_t v8 = [v7 intValue];
      if (v8)
      {
LABEL_7:
        uint64_t v10 = [v4 path];
        objc_super v11 = [v10 lastPathComponent];
        if ([v11 length])
        {
          int v12 = [v11 characterAtIndex:0];
          if ((v12 | 4) != 0x74)
          {
            v13 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
              +[EKObjectID objectIDWithURL:].cold.4(v12, v13);
            }
          }
          v14 = [v11 substringFromIndex:1];
          uint64_t v15 = [v14 intValue];

          v16 = [v10 pathComponents];
          if ((unint64_t)[v16 count] > 1)
          {
            uint64_t v21 = [v16 objectAtIndex:1];
            if (objectIDWithURL__onceToken != -1) {
              dispatch_once(&objectIDWithURL__onceToken, &__block_literal_global_71);
            }
            v25 = (void *)v21;
            v22 = [(id)objectIDWithURL__entityNameToEntityTypeMap objectForKeyedSubscript:v21];
            if (v22)
            {
              v18 = objc_msgSend(objc_alloc((Class)a1), "initWithEntityType:rowID:databaseID:temporary:", objc_msgSend(v22, "intValue"), v15, v8, v12 == 116);
            }
            else
            {
              v23 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
                +[EKObjectID objectIDWithURL:v4];
              }
              v18 = 0;
            }
          }
          else
          {
            v17 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
              +[EKObjectID objectIDWithURL:](v17);
            }
            v18 = 0;
          }
        }
        else
        {
          v20 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
            +[EKObjectID objectIDWithURL:](v20);
          }
          v18 = 0;
        }

        goto LABEL_31;
      }
      uint64_t v9 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKObjectID objectIDWithURL:v7];
      }
    }
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  v19 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKObjectID objectIDWithURL:].cold.6(v19, v4);
  }
  v18 = 0;
LABEL_31:

  return (EKObjectID *)v18;
}

void __30__EKObjectID_objectIDWithURL___block_invoke()
{
  v0 = (void *)objectIDWithURL__entityNameToEntityTypeMap;
  objectIDWithURL__entityNameToEntityTypeMap = (uint64_t)&unk_1EF953270;
}

- (EKObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EKObjectID;
  uint64_t v5 = [(EKObjectID *)&v7 init];
  if (v5)
  {
    v5->_entityType = [v4 decodeIntForKey:@"entityType"];
    v5->_unsigned int rowID = [v4 decodeIntForKey:@"rowID"];
    v5->_databaseID = [v4 decodeIntForKey:@"dbID"];
    v5->_temporary = [v4 decodeBoolForKey:@"temporary"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt:self->_entityType forKey:@"entityType"];
  [v5 encodeInt:self->_rowID forKey:@"rowID"];
  uint64_t databaseID = self->_databaseID;
  if (databaseID) {
    [v5 encodeInt:databaseID forKey:@"dbID"];
  }
  [v5 encodeBool:self->_temporary forKey:@"temporary"];
}

- (EKObjectID)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKObjectID;
  id v5 = [(EKObjectID *)&v11 init];
  if (v5)
  {
    char v6 = [v4 objectForKey:@"entityType"];
    v5->_entityType = [v6 intValue];

    objc_super v7 = [v4 objectForKey:@"rowID"];
    v5->_unsigned int rowID = [v7 intValue];

    uint64_t v8 = [v4 objectForKey:@"dbID"];
    v5->_uint64_t databaseID = [v8 intValue];

    uint64_t v9 = [v4 objectForKey:@"temporary"];
    v5->_temporary = [v9 BOOLValue];
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"entityType";
  uint64_t v3 = [NSNumber numberWithInt:self->_entityType];
  v10[0] = v3;
  v9[1] = @"rowID";
  id v4 = [NSNumber numberWithInt:self->_rowID];
  v10[1] = v4;
  v9[2] = @"dbID";
  id v5 = [NSNumber numberWithInt:self->_databaseID];
  v10[2] = v5;
  v9[3] = @"temporary";
  char v6 = [NSNumber numberWithBool:self->_temporary];
  v10[3] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (int)rowID
{
  return self->_rowID;
}

- (CADObjectID)CADObjectID
{
  return (CADObjectID *)[(EKObjectID *)self CADObjectIDWithGeneration:0xFFFFFFFFLL];
}

- (NSString)stringRepresentation
{
  uint64_t databaseID = self->_databaseID;
  id v4 = NSString;
  uint64_t v5 = [(EKObjectID *)self entityName];
  char v6 = (void *)v5;
  objc_super v7 = @"t";
  if (!self->_temporary) {
    objc_super v7 = @"p";
  }
  uint64_t rowID = self->_rowID;
  if (databaseID) {
    [v4 stringWithFormat:@"%@://%d/%@/%@%d", @"x-apple-eventkit", databaseID, v5, v7, rowID];
  }
  else {
  uint64_t v9 = [v4 stringWithFormat:@"%@:///%@/%@%d", @"x-apple-eventkit", v5, v7, rowID, v11];
  }

  return (NSString *)v9;
}

- (NSURL)URIRepresentation
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [(EKObjectID *)self stringRepresentation];
  id v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

+ (id)CADObjectIDsFromEKObjectIDs:(id)a3 withGeneration:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "CADObjectIDWithGeneration:", v4, (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)EKObjectIDsFromCADObjectIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)EKObjectIDsFromData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        long long v12 = +[EKObjectID EKObjectIDsFromData:databaseID:](EKObjectID, "EKObjectIDsFromData:databaseID:", v11, [v10 intValue]);
        if ([v12 count])
        {
          if (v7)
          {
            if (!v6)
            {
              id v6 = (id)[v7 mutableCopy];

              id v7 = v6;
            }
            [v6 addObjectsFromArray:v12];
          }
          else
          {
            id v7 = v12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }

  return v7;
}

+ (id)EKObjectIDsFromData:(id)a3 databaseID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_msgSend(a1, "EKObjectIDsFromData:range:databaseID:", v6, 0, (unint64_t)objc_msgSend(v6, "length") >> 3, v4);

  return v7;
}

+ (id)EKObjectIDsFromData:(id)a3 range:(_NSRange)a4 databaseID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  if (8 * (location + length) <= [v8 length])
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:length];
    uint64_t v11 = [v8 bytes];
    if (location < location + length)
    {
      long long v12 = (unsigned int *)(v11 + 8 * location + 4);
      do
      {
        long long v13 = +[EKObjectID objectIDWithEntityType:*(v12 - 1) rowID:*v12 databaseID:v5];
        [v10 addObject:v13];

        v12 += 2;
        --length;
      }
      while (length);
    }
  }
  else
  {
    uint64_t v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKObjectID EKObjectIDsFromData:range:databaseID:](v9, v8);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

+ (void)objectIDWithURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "EKObjectID URL has no path", v1, 2u);
}

+ (void)objectIDWithURL:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "EKObjectID URL has no entity name", v1, 2u);
}

+ (void)objectIDWithURL:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v11 = [a3 path];
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v5, v6, "Unknown entity name %@ with URI %@", v7, v8, v9, v10, 2u);
}

+ (void)objectIDWithURL:(int)a1 .cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "URL with unrecognized ID type %c", (uint8_t *)v2, 8u);
}

+ (void)objectIDWithURL:(void *)a3 .cold.5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 length];
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v5, v6, "Redundant specification of database ID 0 (URL %@ has host length %lu)", v7, v8, v9, v10, 2u);
}

+ (void)objectIDWithURL:(void *)a1 .cold.6(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = [a2 scheme];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = @"x-apple-eventkit";
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Wrong scheme for EKObjectID URL; got %@, expected %@; will return nil for objectIDWithURL:",
    (uint8_t *)&v5,
    0x16u);
}

+ (void)EKObjectIDsFromData:(void *)a1 range:(void *)a2 databaseID:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Invalid range passed to +[EKObjectIDsFromData:range:]. Need at least %lu bytes, but only have %lu", v6, v7, v8, v9, 0);
}

@end