@interface BMDSLBaseCodable
+ (BOOL)supportsSecureCoding;
+ (NSString)name;
- (BMDSLBaseCodable)initWithCoder:(id)a3;
- (BMDSLBaseCodable)initWithDictionary:(id)a3 error:(id *)a4;
- (BMDSLBaseCodable)initWithName:(id)a3 version:(unsigned int)a4;
- (BOOL)allowsEvaluation;
- (BOOL)isEvaluationBlocked;
- (NSString)name;
- (unsigned)version;
- (void)allowEvaluation;
- (void)encodeWithCoder:(id)a3;
- (void)setEvaluationBlocked:(BOOL)a3;
@end

@implementation BMDSLBaseCodable

+ (NSString)name
{
  return (NSString *)@"base";
}

- (BMDSLBaseCodable)initWithName:(id)a3 version:(unsigned int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMDSLBaseCodable;
  v7 = [(BMDSLBaseCodable *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_version = a4;
    v7->_evaluationBlocked = 0;
  }

  return v7;
}

- (BMDSLBaseCodable)initWithDictionary:(id)a3 error:(id *)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKey:@"name"];
  Class v8 = NSClassFromString(&cfstr_Bmdslstreampub.isa);
  if (v8)
  {
    Class v9 = v8;
    v10 = +[BMDSLFilter name];
    v17[0] = v10;
    v17[1] = @"streamPublisher";
    v18[0] = objc_opt_class();
    v18[1] = v9;
    objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

    v12 = [v11 objectForKeyedSubscript:v7];
  }
  else
  {
    objc_super v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMDSLBaseCodable initWithDictionary:error:](v11);
    }
    v12 = 0;
  }

  if (v12)
  {
    v13 = (BMDSLBaseCodable *)[[v12 alloc] initWithDictionary:v6 error:a4];
  }
  else
  {
    v14 = [NSString stringWithFormat:@"no operator for name %@", v7];
    v15 = BMDSLDecodeError((uint64_t)v14);

    if (a4) {
      *a4 = v15;
    }

    v13 = 0;
  }

  return v13;
}

- (void)allowEvaluation
{
}

- (BOOL)allowsEvaluation
{
  return ![(BMDSLBaseCodable *)self isEvaluationBlocked];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInt:", -[BMDSLBaseCodable version](self, "version"));
  [v5 encodeObject:v6 forKey:@"version"];

  id v7 = [(BMDSLBaseCodable *)self name];
  [v5 encodeObject:v7 forKey:@"name"];
}

- (BMDSLBaseCodable)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  uint64_t v6 = [v5 unsignedShortValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];

  Class v8 = [(BMDSLBaseCodable *)self initWithName:v7 version:v6];
  [(BMDSLBaseCodable *)v8 setEvaluationBlocked:1];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)isEvaluationBlocked
{
  return self->_evaluationBlocked;
}

- (void)setEvaluationBlocked:(BOOL)a3
{
  self->_evaluationBlocked = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3086000, log, OS_LOG_TYPE_ERROR, "must link BiomeStreams to use BMDSL dictionary coding/decoding", v1, 2u);
}

@end