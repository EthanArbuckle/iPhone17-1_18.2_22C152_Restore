@interface _DKEventStream
+ (BOOL)supportsSecureCoding;
+ (id)eventStreamWithName:(id)a3;
+ (id)eventStreamWithName:(id)a3 valueType:(id)a4;
+ (id)fromPBCodable:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (_CDEventStreamProperties)eventProperties;
- (_DKEventStream)initWithCoder:(id)a3;
- (_DKEventStream)initWithName:(id)a3 valueType:(id)a4 cache:(id)a5;
- (_DKObjectType)eventValueType;
- (id)toPBCodable;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _DKEventStream

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_eventValueType forKey:@"eventValueType"];
}

- (id)toPBCodable
{
  v3 = [(_DKEventStream *)self name];
  v4 = [(_DKEventStream *)self eventValueType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v6 = 0;
  }
  else
  {
    v7 = [(_DKEventStream *)self eventValueType];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      int v6 = 1;
    }
    else
    {
      v9 = [(_DKEventStream *)self eventValueType];
      objc_opt_class();
      char v10 = objc_opt_isKindOfClass();

      if (v10) {
        int v6 = 2;
      }
      else {
        int v6 = 3;
      }
    }
  }
  v11 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValueType setType:]((uint64_t)v11, v6);
  v12 = [(_DKEventStream *)self eventValueType];
  -[_DKPRValueType setTypeCode:]((uint64_t)v11, [v12 typeCode]);

  v13 = objc_alloc_init(_DKPRStream);
  -[_DKPRStream setName:]((uint64_t)v13, v3);
  -[_DKPRStream setType:]((uint64_t)v13, v11);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (id)eventStreamWithName:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() eventStreamWithName:v3 valueType:0];

  return v4;
}

+ (id)eventStreamWithName:(id)a3 valueType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[_CDEventStreams eventStreamPropertiesForKBName:v5];
  char v8 = [v7 valueType];

  if (v8)
  {
    if (v6)
    {
      v9 = [v7 valueType];
      char v10 = [v9 isEqual:v6];

      if ((v10 & 1) == 0)
      {
        v11 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = [v7 valueType];
          int v17 = 138412802;
          id v18 = v5;
          __int16 v19 = 2112;
          id v20 = v6;
          __int16 v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_INFO, "Event with stream %@ had valueType %@ but should be %@. Overriding.", (uint8_t *)&v17, 0x20u);
        }
      }
    }
    uint64_t v13 = [v7 valueType];

    id v6 = (id)v13;
  }
  v14 = +[_DKEventStreamCache sharedCached];
  v15 = [v14 eventStreamWithName:v5 valueType:v6];

  return v15;
}

- (_DKObjectType)eventValueType
{
  return (_DKObjectType *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventValueType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventProperties, 0);
}

- (_DKEventStream)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventValueType"];

  v7 = +[_DKEventStreamCache sharedCached];
  char v8 = [(_DKEventStream *)self initWithName:v5 valueType:v6 cache:v7];

  return v8;
}

- (_DKEventStream)initWithName:(id)a3 valueType:(id)a4 cache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (!v11
      || ([v11 eventStreamWithName:v9 valueType:v10],
          (uint64_t v13 = (_DKEventStream *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v19.receiver = self;
      v19.super_class = (Class)_DKEventStream;
      v14 = [(_DKEventStream *)&v19 init];
      p_isa = (id *)&v14->super.isa;
      if (v14)
      {
        objc_storeStrong((id *)&v14->_name, a3);
        objc_storeStrong(p_isa + 3, a4);
      }
      uint64_t v13 = p_isa;
      self = v13;
    }
    v16 = v13;
  }
  else
  {
    int v17 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_DKEventStream initWithName:valueType:cache:](v17);
    }

    v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@: { name=%@, valueType=%@ }", v5, self->_name, self->_eventValueType];

  return (NSString *)v6;
}

- (_CDEventStreamProperties)eventProperties
{
  v2 = self;
  objc_sync_enter(v2);
  eventProperties = v2->_eventProperties;
  if (!eventProperties)
  {
    uint64_t v4 = +[_CDEventStreams eventStreamPropertiesForKBName:v2->_name];
    id v5 = v2->_eventProperties;
    v2->_eventProperties = (_CDEventStreamProperties *)v4;

    eventProperties = v2->_eventProperties;
  }
  id v6 = eventProperties;
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)hash
{
  id v3 = [(_DKEventStream *)self name];
  uint64_t v4 = [v3 hash];
  id v5 = [(_DKEventStream *)self eventValueType];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_DKEventStream *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    v7 = [(_DKEventStream *)self name];
    char v8 = [(_DKEventStream *)v6 name];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(_DKEventStream *)self eventValueType];
      uint64_t v10 = [v9 typeCode];
      id v11 = [(_DKEventStream *)v6 eventValueType];
      BOOL v12 = v10 == [v11 typeCode];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = -[_DKPRStream name]((uint64_t)v4);
    unint64_t v6 = -[_DKPRStream type]((uint64_t)v4);
    unsigned int v7 = -[_DKPRValueType type]((uint64_t)v6);

    if (v7 > 2)
    {
      uint64_t v10 = 0;
    }
    else
    {
      char v8 = *off_1E560F038[v7];
      id v9 = -[_DKPRStream type]((uint64_t)v4);
      uint64_t v10 = [v8 objectTypeWithTypeCode:-[_DKPRValueType typeCode]((uint64_t)v9)];
    }
    id v11 = +[_DKEventStream eventStreamWithName:v5 valueType:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)initWithName:(os_log_t)log valueType:cache:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "nil name passed to _DKEventStream initializer", v1, 2u);
}

@end