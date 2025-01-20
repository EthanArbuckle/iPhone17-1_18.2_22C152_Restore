@interface BMDSLTumblingWindowAssigner
+ (BOOL)supportsSecureCoding;
- (BMDSLAggregator)aggregator;
- (BMDSLTumblingWindowAssigner)initWithCoder:(id)a3;
- (BMDSLTumblingWindowAssigner)initWithInterval:(double)a3 timestampKeyPaths:(id)a4 aggregator:(id)a5;
- (BMDSLTumblingWindowAssigner)initWithInterval:(double)a3 timestampKeyPaths:(id)a4 aggregator:(id)a5 name:(id)a6 version:(unsigned int)a7;
- (NSArray)timestampKeyPaths;
- (double)interval;
- (id)bpsWindowAssigner;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregator:(id)a3;
- (void)setInterval:(double)a3;
- (void)setTimestampKeyPaths:(id)a3;
@end

@implementation BMDSLTumblingWindowAssigner

- (BMDSLTumblingWindowAssigner)initWithInterval:(double)a3 timestampKeyPaths:(id)a4 aggregator:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  id v11 = a4;
  id v12 = a5;
  if (a7 == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)BMDSLTumblingWindowAssigner;
    v13 = [(BMDSLBaseCodable *)&v20 initWithName:@"tumblingAssigner" version:1];
    v14 = v13;
    if (v13)
    {
      v13->_interval = a3;
      objc_storeStrong((id *)&v13->_aggregator, a5);
      uint64_t v15 = [v11 copy];
      timestampKeyPaths = v14->_timestampKeyPaths;
      v14->_timestampKeyPaths = (NSArray *)v15;
    }
    self = v14;
    v17 = self;
  }
  else
  {
    v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMDSLTumblingWindowAssigner initWithInterval:timestampKeyPaths:aggregator:name:version:](a7, v18);
    }

    v17 = 0;
  }

  return v17;
}

- (BMDSLTumblingWindowAssigner)initWithInterval:(double)a3 timestampKeyPaths:(id)a4 aggregator:(id)a5
{
  return [(BMDSLTumblingWindowAssigner *)self initWithInterval:a4 timestampKeyPaths:a5 aggregator:@"tumblingAssigner" name:1 version:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLTumblingWindowAssigner;
  [(BMDSLBaseCodable *)&v10 encodeWithCoder:v4];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(BMDSLTumblingWindowAssigner *)self interval];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 encodeObject:v6 forKey:@"interval"];

  v7 = [(BMDSLTumblingWindowAssigner *)self timestampKeyPaths];
  [v4 encodeObject:v7 forKey:@"timestampKeyPaths"];

  v8 = [(BMDSLTumblingWindowAssigner *)self aggregator];

  if (v8)
  {
    v9 = [(BMDSLTumblingWindowAssigner *)self aggregator];
    [v4 encodeObject:v9 forKey:@"aggregator"];
  }
}

- (BMDSLTumblingWindowAssigner)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMDSLTumblingWindowAssigner;
  v5 = [(BMDSLBaseCodable *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
    [v6 doubleValue];
    double v8 = v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aggregator"];
    objc_super v10 = +[BMDSLClasses allowed];
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"timestampKeyPaths"];

    id v12 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLTumblingWindowAssigner *)v5 initWithInterval:v11 timestampKeyPaths:v9 aggregator:v12 name:[(BMDSLBaseCodable *)v5 version] version:v8];
  }
  return v5;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (BMDSLAggregator)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
}

- (NSArray)timestampKeyPaths
{
  return self->_timestampKeyPaths;
}

- (void)setTimestampKeyPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampKeyPaths, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

- (id)bpsWindowAssigner
{
  v3 = [(BMDSLTumblingWindowAssigner *)self aggregator];
  id v4 = [v3 bpsAggregator];

  if (!v4) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F501F0]) initWithAccumulator:0 closure:&__block_literal_global];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F50240]);
  [(BMDSLTumblingWindowAssigner *)self interval];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BMDSLTumblingWindowAssigner_BPSPubSub__bpsWindowAssigner__block_invoke_2;
  v8[3] = &unk_1E6021750;
  v8[4] = self;
  v6 = objc_msgSend(v5, "initWithInterval:timestamp:aggregator:", v8, v4);

  return v6;
}

id __59__BMDSLTumblingWindowAssigner_BPSPubSub__bpsWindowAssigner__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (!v4) {
    id v4 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  }
  [v4 addObject:v5];

  return v4;
}

id __59__BMDSLTumblingWindowAssigner_BPSPubSub__bpsWindowAssigner__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "timestampKeyPaths", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(NSString **)(*((void *)&v15 + 1) + 8 * i);
        NSSelectorFromString(v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v3 valueForKey:v9];
          [v11 doubleValue];
          double v13 = v12;

          objc_super v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v13];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_super v10 = [MEMORY[0x1E4F1C9C8] date];
LABEL_11:

  return v10;
}

- (void)initWithInterval:(int)a1 timestampKeyPaths:(NSObject *)a2 aggregator:name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLTumblingWindowAssigner", (uint8_t *)v2, 8u);
}

@end