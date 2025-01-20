@interface BMSiriQueryResult
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriQueryResult)initWithCoder:(id)a3;
- (BMSiriQueryResult)initWithProto:(id)a3;
- (BMSiriQueryResult)initWithProtoData:(id)a3;
- (BMSiriQueryResult)initWithQID:(id)a3 domain:(id)a4 confidence:(double)a5;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (NSString)qid;
- (double)confidence;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMSiriQueryResult

- (BMSiriQueryResult)initWithQID:(id)a3 domain:(id)a4 confidence:(double)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"BMSiriQueryEvent.m", 26, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)BMSiriQueryResult;
  v12 = [(BMSiriQueryResult *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_qid, a3);
    objc_storeStrong((id *)&v13->_domain, a4);
    v13->_confidence = a5;
  }

  return v13;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMSiriQueryResult eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"qid";
  qid = self->_qid;
  v4 = qid;
  if (!qid)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  domain = self->_domain;
  v10[0] = v4;
  v10[1] = domain;
  v9[1] = @"domain";
  v9[2] = @"confidence";
  id v6 = [NSNumber numberWithDouble:self->_confidence];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  if (!qid) {

  }
  return v7;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMSiriQueryResult *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMSiriQueryResult *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSiriQueryResult *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMSiriQueryResult)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMSiriQueryResult *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMSiriQueryResult *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSiriQueryResult)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasDomain]
        && ([v5 hasConfidence] & 1) != 0)
      {
        id v6 = [v5 qid];
        v7 = [v5 domain];
        [v5 confidence];
        self = -[BMSiriQueryResult initWithQID:domain:confidence:](self, "initWithQID:domain:confidence:", v6, v7);

        id v8 = self;
LABEL_13:

        goto LABEL_14;
      }
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMSiriQueryResult initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSiriQueryResult initWithProto:]();
      }
    }
    id v8 = 0;
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_14:

  return v8;
}

- (BMSiriQueryResult)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriQueryResult alloc] initWithData:v4];

    self = [(BMSiriQueryResult *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMSiriQueryResult *)self qid];
  [v3 setQid:v4];

  id v5 = [(BMSiriQueryResult *)self domain];
  [v3 setDomain:v5];

  [(BMSiriQueryResult *)self confidence];
  objc_msgSend(v3, "setConfidence:");

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  id v4 = [NSNumber numberWithDouble:self->_confidence];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_18;
  }
  id v7 = v6;
  id v8 = v7;
  qid = self->_qid;
  id v10 = qid;
  if (!qid)
  {
    NSUInteger v3 = [v7 qid];
    if (!v3)
    {
      int v11 = 0;
      goto LABEL_10;
    }
    id v10 = self->_qid;
  }
  id v4 = [v8 qid];
  if (![(NSString *)v10 isEqualToString:v4])
  {
    BOOL v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  int v11 = 1;
LABEL_10:
  domain = self->_domain;
  v14 = [v8 domain];
  if ([(NSString *)domain isEqualToString:v14])
  {
    double confidence = self->_confidence;
    [v8 confidence];
    BOOL v12 = confidence == v16;
  }
  else
  {
    BOOL v12 = 0;
  }

  if (v11) {
    goto LABEL_14;
  }
LABEL_15:
  if (!qid) {

  }
LABEL_18:
  return v12;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  domain = self->_domain;
  if (a4 && !domain)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  }
  return domain != 0;
}

- (NSString)qid
{
  return self->_qid;
}

- (NSString)domain
{
  return self->_domain;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_qid, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMSiriQueryResult: Mismatched data versions (%u != %u) cannot deserialize", v1, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriQueryResult: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMSiriQueryResult: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMSiriQueryResult: tried to initialize with a non-BMSiriQueryResult proto", v2, v3, v4, v5, v6);
}

@end