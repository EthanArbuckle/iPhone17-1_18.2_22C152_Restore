@interface CADPropertySearchPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)randomize;
- (BOOL)validate;
- (CADObjectID)sourceID;
- (CADPropertySearchPredicate)initWithCoder:(id)a3;
- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendar:(id)a5;
- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5;
- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 limit:(int64_t)a6 randomize:(BOOL)a7;
- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 source:(id)a6;
- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 source:(id)a6 limit:(int64_t)a7 randomize:(BOOL)a8;
- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 source:(id)a5;
- (NSArray)calendarIDs;
- (NSArray)filters;
- (id)buildWhereClauseWithValues:(id)a3 andTypes:(id)a4 forDatabase:(int)a5;
- (id)calendarRowIDsByDatabaseID;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)databasesToQuery;
- (id)extendWhereClauseWithCalendarOrSourceLimitation:(id)a3 withValues:(id)a4 andTypes:(id)a5 forDatabase:(int)a6;
- (id)extendWhereClauseWithEntityTypeLimitation:(id)a3 withValues:(id)a4 andTypes:(id)a5;
- (id)predicateFormat;
- (int)entityType;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADPropertySearchPredicate

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendar:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a5)
  {
    id v13 = a5;
    v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = a5;
    a5 = [v9 arrayWithObjects:&v13 count:1];
  }
  v11 = -[CADPropertySearchPredicate initWithEntityType:filters:calendars:source:](self, "initWithEntityType:filters:calendars:source:", v6, v8, a5, 0, v13, v14);

  return v11;
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 source:(id)a5
{
  return [(CADPropertySearchPredicate *)self initWithEntityType:*(void *)&a3 filters:a4 calendars:0 source:a5];
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5
{
  return [(CADPropertySearchPredicate *)self initWithEntityType:*(void *)&a3 filters:a4 calendars:a5 source:0];
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 limit:(int64_t)a6 randomize:(BOOL)a7
{
  return [(CADPropertySearchPredicate *)self initWithEntityType:*(void *)&a3 filters:a4 calendars:a5 source:0 limit:a6 randomize:a7];
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 source:(id)a6
{
  return [(CADPropertySearchPredicate *)self initWithEntityType:*(void *)&a3 filters:a4 calendars:a5 source:a6 limit:0 randomize:0];
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 source:(id)a6 limit:(int64_t)a7 randomize:(BOOL)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CADPropertySearchPredicate;
  v17 = [(CADPropertySearchPredicate *)&v23 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_3;
  }
  v17->_entityType = a3;
  uint64_t v19 = [v14 copy];
  filters = v18->_filters;
  v18->_filters = (NSArray *)v19;

  objc_storeStrong((id *)&v18->_sourceID, a6);
  objc_storeStrong((id *)&v18->_calendarIDs, a5);
  v18->_limit = a7;
  v18->_randomize = a8;
  if (![(CADPropertySearchPredicate *)v18 validate]) {
    v21 = 0;
  }
  else {
LABEL_3:
  }
    v21 = v18;

  return v21;
}

- (BOOL)validate
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  calendarIDs = self->_calendarIDs;
  if (calendarIDs && self->_sourceID)
  {
    uint64_t v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v5 = self->_calendarIDs;
      sourceID = self->_sourceID;
      *(_DWORD *)buf = 138412546;
      v30 = v5;
      __int16 v31 = 2112;
      v32 = sourceID;
      v7 = "Searching inside both calendars (%@) and source (%@) is not supported.";
      id v8 = v4;
      uint32_t v9 = 22;
LABEL_26:
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      return 0;
    }
    return 0;
  }
  int entityType = self->_entityType;
  if ((entityType - 2) >= 2 && entityType != 101)
  {
    if (entityType != 1)
    {
      uint64_t v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        int v22 = self->_entityType;
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v22;
        v7 = "Searching for the entity type: %i is not supported yet.";
        id v8 = v21;
        uint32_t v9 = 8;
        goto LABEL_26;
      }
      return 0;
    }
    if (calendarIDs)
    {
      uint64_t v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v7 = "Searching for calendars inside of calendars is not supported.";
        id v8 = v11;
        uint32_t v9 = 2;
        goto LABEL_26;
      }
      return 0;
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = self->_filters;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(NSArray **)(*((void *)&v24 + 1) + 8 * i);
        if ((-[NSArray applicableToEntityType:](v17, "applicableToEntityType:", self->_entityType, (void)v24) & 1) == 0)
        {
          uint64_t v19 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            int v20 = self->_entityType;
            *(_DWORD *)buf = 138412546;
            v30 = v17;
            __int16 v31 = 1024;
            LODWORD(v32) = v20;
            _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, "Cannot use filter %@ with entity type %i", buf, 0x12u);
          }
          BOOL v18 = 0;
          goto LABEL_23;
        }
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_23:

  return v18;
}

- (CADPropertySearchPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CADPropertySearchPredicate;
  v5 = [(CADPropertySearchPredicate *)&v18 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  v5->_int entityType = [v4 decodeIntegerForKey:@"entityType"];
  uint64_t v6 = _CADPropertySearchPredicateGetAllowedFilterTypes();
  uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"filters"];
  filters = v5->_filters;
  v5->_filters = (NSArray *)v7;

  uint32_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"calendarIDs"];
  calendarIDs = v5->_calendarIDs;
  v5->_calendarIDs = (NSArray *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceID"];
  sourceID = v5->_sourceID;
  v5->_sourceID = (CADObjectID *)v14;

  v5->_limit = [v4 decodeIntegerForKey:@"limit"];
  v5->_randomize = [v4 decodeBoolForKey:@"randomize"];
  id v16 = 0;
  if ([(CADPropertySearchPredicate *)v5 validate]) {
LABEL_3:
  }
    id v16 = v5;

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADPropertySearchPredicate;
  id v4 = a3;
  [(CADPropertySearchPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_entityType, @"entityType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_filters forKey:@"filters"];
  [v4 encodeObject:self->_calendarIDs forKey:@"calendarIDs"];
  [v4 encodeObject:self->_sourceID forKey:@"sourceID"];
  [v4 encodeInteger:self->_limit forKey:@"limit"];
  [v4 encodeBool:self->_randomize forKey:@"randomize"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)databasesToQuery
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_sourceID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[CADObjectID databaseID](self->_sourceID, "databaseID"));
    v5[0] = v2;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = [(CADPropertySearchPredicate *)self calendarRowIDsByDatabaseID];
  }
  return v3;
}

- (id)extendWhereClauseWithEntityTypeLimitation:(id)a3 withValues:(id)a4 andTypes:(id)a5
{
  id v8 = a3;
  if ((self->_entityType & 0xFFFFFFFE) == 2)
  {
    id v9 = a5;
    id v10 = a4;
    uint64_t v11 = _CADPropertySearchPredicateExtendWhereClause(v8, 0, @"entity_type = ?");

    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_entityType];
    [v10 addObject:v12];

    [v9 addObject:&unk_1F151D968];
    id v8 = (id)v11;
  }
  return v8;
}

- (id)calendarRowIDsByDatabaseID
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  calendarRowIDsByDatabaseID = self->_calendarRowIDsByDatabaseID;
  if (!calendarRowIDsByDatabaseID)
  {
    if (self->_calendarIDs)
    {
      uint64_t v16 = 16;
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v17 = self;
      objc_super v5 = self->_calendarIDs;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v19 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v10, "databaseID", v16));
            id v12 = [v4 objectForKeyedSubscript:v11];
            if (!v12)
            {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v4 setObject:v12 forKeyedSubscript:v11];
            }
            uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v10, "entityID"));
            [v12 addObject:v13];
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v7);
      }

      uint64_t v14 = *(Class *)((char *)&v17->super.super.super.isa + v16);
      *(Class *)((char *)&v17->super.super.super.isa + v16) = (Class)v4;

      calendarRowIDsByDatabaseID = *(NSDictionary **)((char *)&v17->super.super.super.isa + v16);
    }
    else
    {
      calendarRowIDsByDatabaseID = 0;
    }
  }
  return calendarRowIDsByDatabaseID;
}

- (id)extendWhereClauseWithCalendarOrSourceLimitation:(id)a3 withValues:(id)a4 andTypes:(id)a5 forDatabase:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_calendarIDs)
  {
    uint64_t v13 = [(CADPropertySearchPredicate *)self calendarRowIDsByDatabaseID];
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    uint64_t v16 = [v15 componentsJoinedByString:@", "];
    v17 = [NSString stringWithFormat:@"calendar_id IN (%@)", v16];
    uint64_t v18 = _CADPropertySearchPredicateExtendWhereClause(v10, 0, v17);

    id v10 = (id)v18;
  }
  else if (self->_sourceID)
  {
    uint64_t v19 = _CADPropertySearchPredicateExtendWhereClause(v10, 0, @"calendar_id IN (SELECT ROWID FROM Calendar WHERE store_id = ?)");

    long long v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[CADObjectID entityID](self->_sourceID, "entityID"));
    [v11 addObject:v20];

    [v12 addObject:&unk_1F151D968];
    id v10 = (id)v19;
  }

  return v10;
}

- (id)buildWhereClauseWithValues:(id)a3 andTypes:(id)a4 forDatabase:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CADPropertySearchPredicate *)self extendWhereClauseWithEntityTypeLimitation:0 withValues:v8 andTypes:v9];
  id v11 = [(CADPropertySearchPredicate *)self extendWhereClauseWithCalendarOrSourceLimitation:v10 withValues:v8 andTypes:v9 forDatabase:v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_filters;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      v17 = v11;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "extendWhereClause:usingOperation:withValues:andTypes:", v17, 0, v8, v9, (void)v19);

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(CADPropertySearchPredicate *)self buildWhereClauseWithValues:v4 andTypes:v5 forDatabase:CalDatabaseGetAuxilliaryDatabaseID()];
  uint64_t v7 = (void *)CalDatabaseCopyEntitiesWhere();

  return v7;
}

- (id)predicateFormat
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  sourceID = self->_sourceID;
  if (sourceID)
  {
    uint64_t v6 = [(CADObjectID *)sourceID databaseID];
  }
  else if ([(NSArray *)self->_calendarIDs count])
  {
    uint64_t v7 = [(NSArray *)self->_calendarIDs firstObject];
    uint64_t v6 = [v7 databaseID];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F574B8];
  }
  long long v25 = (void *)v4;
  id v8 = [(CADPropertySearchPredicate *)self buildWhereClauseWithValues:v3 andTypes:v4 forDatabase:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v15 = [v8 rangeOfString:@"?"];
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = v15;
          uint64_t v18 = v16;
          long long v19 = [v14 description];
          objc_msgSend(v8, "replaceCharactersInRange:withString:", v17, v18, v19);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  long long v20 = NSString;
  long long v21 = (objc_class *)objc_opt_class();
  long long v22 = NSStringFromClass(v21);
  uint64_t v23 = [v20 stringWithFormat:@"%@: %@", v22, v8];

  return v23;
}

- (int)entityType
{
  return self->_entityType;
}

- (NSArray)filters
{
  return self->_filters;
}

- (NSArray)calendarIDs
{
  return self->_calendarIDs;
}

- (CADObjectID)sourceID
{
  return self->_sourceID;
}

- (int64_t)limit
{
  return self->_limit;
}

- (BOOL)randomize
{
  return self->_randomize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_calendarIDs, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_calendarRowIDsByDatabaseID, 0);
}

@end