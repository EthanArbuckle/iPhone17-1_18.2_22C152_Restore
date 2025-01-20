@interface BMDSLState
+ (BOOL)supportsSecureCoding;
+ (id)name;
- (BMDSL)upstream;
- (BMDSLState)initWithCoder:(id)a3;
- (BMDSLState)initWithName:(id)a3 version:(unsigned int)a4 upstream:(id)a5 key:(id)a6 value:(id)a7;
- (BMDSLState)initWithUpstream:(id)a3 key:(id)a4 value:(id)a5;
- (BMDSLStateValue)combinedValue;
- (BMDSLStateValue)value;
- (NSString)key;
- (id)bpsPublisher;
- (id)upstreamCombinedState;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
- (void)setCombinedValue:(id)a3;
@end

@implementation BMDSLState

- (id)upstreamCombinedState
{
  v4.receiver = self;
  v4.super_class = (Class)BMDSLState;
  v2 = [(BMDSL *)&v4 combinedState];
  return v2;
}

- (id)bpsPublisher
{
  v3 = [(BMDSLState *)self upstream];
  objc_super v4 = [v3 bpsPublisher];

  v5 = [_BMDSLStatePublisher alloc];
  v6 = [(BMDSLState *)self value];
  v7 = [(_BMDSLStatePublisher *)v5 initWithUpstream:v4 state:v6 DSLState:self];

  return v7;
}

+ (id)name
{
  return @"state";
}

- (BMDSLState)initWithName:(id)a3 version:(unsigned int)a4 upstream:(id)a5 key:(id)a6 value:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4 == 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)BMDSLState;
    v16 = [(BMDSLBaseCodable *)&v23 initWithName:a3 version:1];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_upstream, a5);
      uint64_t v18 = [v14 copy];
      key = v17->_key;
      v17->_key = (NSString *)v18;

      objc_storeStrong((id *)&v17->_value, a7);
    }
    self = v17;
    v20 = self;
  }
  else
  {
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[BMDSLState initWithName:version:upstream:key:value:](a4, v21);
    }

    v20 = 0;
  }

  return v20;
}

- (BMDSLState)initWithUpstream:(id)a3 key:(id)a4 value:(id)a5
{
  return [(BMDSLState *)self initWithName:@"state" version:1 upstream:a3 key:a4 value:a5];
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLState *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLState;
  [(BMDSLBaseCodable *)&v9 encodeWithCoder:v4];
  v5 = [(BMDSLState *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  v6 = [(BMDSLState *)self value];

  if (v6)
  {
    v7 = [(BMDSLState *)self value];
    [v4 encodeObject:v7 forKey:@"value"];
  }
  v8 = [(BMDSLState *)self upstream];
  [v4 encodeObject:v8 forKey:@"upstream"];
}

- (BMDSLState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLState;
  v5 = [(BMDSLBaseCodable *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = +[BMDSLClasses allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"upstream"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    objc_super v9 = +[BMDSLClasses allowed];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"value"];

    v11 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLState *)v5 initWithName:v11 version:[(BMDSLBaseCodable *)v5 version] upstream:v7 key:v8 value:v10];
  }
  return v5;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (NSString)key
{
  return self->_key;
}

- (BMDSLStateValue)value
{
  return self->_value;
}

- (BMDSLStateValue)combinedValue
{
  return self->_combinedValue;
}

- (void)setCombinedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 upstream:key:value:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLState", (uint8_t *)v2, 8u);
}

@end