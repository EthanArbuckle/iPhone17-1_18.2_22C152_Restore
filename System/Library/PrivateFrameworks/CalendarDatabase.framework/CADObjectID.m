@interface CADObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporary;
- (BOOL)isVirtual;
- (CADObjectID)initWithCoder:(id)a3;
- (CADObjectID)initWithDictionaryRepresentation:(id)a3;
- (CADObjectID)initWithEntityType:(int)a3 entityID:(int)a4;
- (CADObjectID)initWithEntityType:(int)a3 entityID:(int)a4 databaseID:(int)a5;
- (id)URIRepresentation;
- (id)dictionaryRepresentation;
- (id)entityName;
- (id)stringRepresentation;
- (int)databaseID;
- (int)entityID;
- (int)entityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADObjectID

- (int)databaseID
{
  return self->_databaseID;
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

- (CADObjectID)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADObjectID;
  v5 = [(CADObjectID *)&v11 init];
  if (!v5) {
    goto LABEL_4;
  }
  int v6 = [v4 decodeIntForKey:@"entityType"];
  v5->_int entityType = v6;
  if (isValidEntityType(v6))
  {
    v5->_entityID = [v4 decodeIntForKey:@"rowID"];
    v5->_databaseID = [v4 decodeIntForKey:@"dbID"];
    v5->_temporary = [v4 decodeBoolForKey:@"temporary"];
LABEL_4:
    v7 = v5;
    goto LABEL_8;
  }
  v8 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    int entityType = v5->_entityType;
    *(_DWORD *)buf = 67109120;
    int v13 = entityType;
    _os_log_impl(&dword_1A8E81000, v8, OS_LOG_TYPE_ERROR, "Unknown entity type (%i) in -[CADObjectID initWithCoder:]", buf, 8u);
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (CADObjectID)initWithEntityType:(int)a3 entityID:(int)a4 databaseID:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CADObjectID;
  v8 = [(CADObjectID *)&v10 init];
  if (v8)
  {
    if (!isValidEntityType(a3)) {
      -[CADObjectID initWithEntityType:entityID:databaseID:](a3);
    }
    v8->_int entityType = a3;
    v8->_entityID = a4;
    v8->_databaseID = a5;
    v8->_temporary = a4 < 0;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CADObjectID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4)
  {
    Class = object_getClass(self);
    if (Class == object_getClass(v5))
    {
      v8 = v5;
      int entityType = self->_entityType;
      if (entityType == [(CADObjectID *)v8 entityType]
        && (int entityID = self->_entityID, entityID == [(CADObjectID *)v8 entityID])
        && (BOOL temporary = self->_temporary, temporary == [(CADObjectID *)v8 isTemporary]))
      {
        int databaseID = self->_databaseID;
        char v7 = databaseID == [(CADObjectID *)v8 databaseID];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = [(CADObjectID *)v5 isEqual:self];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)entityID
{
  return self->_entityID;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt:self->_entityType forKey:@"entityType"];
  [v5 encodeInt:self->_entityID forKey:@"rowID"];
  uint64_t databaseID = self->_databaseID;
  if (databaseID) {
    [v5 encodeInt:databaseID forKey:@"dbID"];
  }
  [v5 encodeBool:self->_temporary forKey:@"temporary"];
}

- (unint64_t)hash
{
  int entityID = self->_entityID;
  if (entityID >= 0) {
    int v3 = self->_entityID;
  }
  else {
    int v3 = -entityID;
  }
  return ((self->_temporary << 31) | ((self->_entityType & 0x7F) << 24) | v3 & 0xFFFFFF) ^ (1327217884 * self->_databaseID);
}

- (BOOL)isVirtual
{
  return self->_entityID == 0x7FFFFFFF;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADObjectID)initWithEntityType:(int)a3 entityID:(int)a4
{
  return [(CADObjectID *)self initWithEntityType:*(void *)&a3 entityID:*(void *)&a4 databaseID:0];
}

- (CADObjectID)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADObjectID;
  id v5 = [(CADObjectID *)&v11 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"entityType"];
    v5->_int entityType = [v6 intValue];

    char v7 = [v4 objectForKeyedSubscript:@"rowID"];
    v5->_int entityID = [v7 intValue];

    v8 = [v4 objectForKeyedSubscript:@"dbID"];
    v5->_uint64_t databaseID = [v8 intValue];

    v9 = [v4 objectForKeyedSubscript:@"temporary"];
    v5->_BOOL temporary = [v9 BOOLValue];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"entityType";
  int v3 = [NSNumber numberWithInt:self->_entityType];
  v10[0] = v3;
  v9[1] = @"rowID";
  id v4 = [NSNumber numberWithInt:self->_entityID];
  v10[1] = v4;
  v9[2] = @"dbID";
  id v5 = [NSNumber numberWithInt:self->_databaseID];
  v10[2] = v5;
  v9[3] = @"temporary";
  int v6 = [NSNumber numberWithBool:self->_temporary];
  v10[3] = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)entityName
{
  return CalEntityTypeGetName(self->_entityType);
}

- (id)stringRepresentation
{
  uint64_t databaseID = self->_databaseID;
  id v4 = NSString;
  uint64_t v5 = [(CADObjectID *)self entityName];
  int v6 = (void *)v5;
  char v7 = @"t";
  if (!self->_temporary) {
    char v7 = @"p";
  }
  uint64_t entityID = self->_entityID;
  if (databaseID) {
    [v4 stringWithFormat:@"%@://%d/%@/%@%d", @"x-apple-eventkit", databaseID, v5, v7, entityID];
  }
  else {
  v9 = [v4 stringWithFormat:@"%@:///%@/%@%d", @"x-apple-eventkit", v5, v7, entityID, v11];
  }

  return v9;
}

- (id)URIRepresentation
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = [(CADObjectID *)self stringRepresentation];
  id v4 = [v2 URLWithString:v3];

  return v4;
}

- (void)initWithEntityType:(int)a1 entityID:databaseID:.cold.1(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_1A8E81000, v2, OS_LOG_TYPE_ERROR, "Unknown entity type (%i) in -[CADObjectID initWithEntityType:entityID:databaseID:]", (uint8_t *)v3, 8u);
  }
  __assert_rtn("-[CADObjectID initWithEntityType:entityID:databaseID:]", "CADObjectID.m", 38, "0");
}

@end