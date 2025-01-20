@interface ASTAction
+ (BOOL)supportsSecureCoding;
- (ASTAction)init;
- (ASTAction)initWithAction:(id)a3 data:(id)a4;
- (ASTAction)initWithCoder:(id)a3;
- (BOOL)generatedId;
- (BOOL)isFinished;
- (NSDictionary)dictionaryValue;
- (NSDictionary)parameters;
- (NSDictionary)results;
- (NSString)action;
- (NSString)identifier;
- (id)acceptableDecoderClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)resultCode;
- (unint64_t)progress;
- (void)encodeWithCoder:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGeneratedId:(BOOL)a3;
- (void)setProgress:(unint64_t)a3;
- (void)setResultCode:(int64_t)a3;
- (void)setResults:(id)a3;
@end

@implementation ASTAction

- (ASTAction)init
{
  v3 = [NSDictionary dictionary];
  v4 = [(ASTAction *)self initWithAction:&stru_26F0AC800 data:v3];

  return v4;
}

- (ASTAction)initWithAction:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ASTAction;
  v9 = [(ASTAction *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    *(_WORD *)&v10->_finished = 0;
    v10->_progress = 0;
    v10->_resultCode = 2;
    uint64_t v11 = [NSDictionary dictionary];
    results = v10->_results;
    v10->_results = (NSDictionary *)v11;

    v13 = [v8 objectForKeyedSubscript:@"id"];

    if (v13)
    {
      uint64_t v14 = [v8 objectForKeyedSubscript:@"id"];
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v14;
    }
    else
    {
      v16 = [MEMORY[0x263F08C38] UUID];
      uint64_t v17 = [v16 UUIDString];
      v18 = v10->_identifier;
      v10->_identifier = (NSString *)v17;

      v10->_generatedId = 1;
    }
    v19 = [v8 objectForKeyedSubscript:@"parameters"];

    if (v19)
    {
      uint64_t v20 = [v8 objectForKeyedSubscript:@"parameters"];
      parameters = v10->_parameters;
      v10->_parameters = (NSDictionary *)v20;
    }
  }

  return v10;
}

- (void)setProgress:(unint64_t)a3
{
  unint64_t v3 = 100;
  if (a3 < 0x64) {
    unint64_t v3 = a3;
  }
  self->_progress = v3;
}

- (unint64_t)progress
{
  return self->_progress;
}

- (void)setFinished:(BOOL)a3
{
  if (a3) {
    self->_finished = 1;
  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSDictionary)dictionaryValue
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(ASTAction *)self action];
  [v3 setObject:v4 forKeyedSubscript:@"action"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ASTAction progress](self, "progress"));
  [v3 setObject:v5 forKeyedSubscript:@"progress"];

  if (![(ASTAction *)self generatedId])
  {
    v6 = [(ASTAction *)self identifier];
    [v3 setObject:v6 forKeyedSubscript:@"id"];
  }
  if ([(ASTAction *)self isFinished])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[ASTAction resultCode](self, "resultCode"));
    [v3 setObject:v7 forKeyedSubscript:@"resultCode"];

    id v8 = [(ASTAction *)self results];
    [v3 setObject:v8 forKeyedSubscript:@"resultPayload"];
  }
  v9 = (void *)[v3 copy];

  return (NSDictionary *)v9;
}

- (ASTAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTAction *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = [(ASTAction *)v5 acceptableDecoderClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v11;

    v5->_progress = [v4 decodeIntegerForKey:@"progress"];
    v5->_resultCode = [v4 decodeIntegerForKey:@"resultCode"];
    v13 = [(ASTAction *)v5 acceptableDecoderClasses];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"resultPayload"];
    results = v5->_results;
    v5->_results = (NSDictionary *)v14;

    v5->_finished = [v4 decodeBoolForKey:@"finished"];
    v5->_generatedId = [v4 decodeBoolForKey:@"generatedId"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(ASTAction *)self action];
  [v8 encodeObject:v4 forKey:@"action"];

  v5 = [(ASTAction *)self identifier];
  [v8 encodeObject:v5 forKey:@"id"];

  uint64_t v6 = [(ASTAction *)self parameters];
  [v8 encodeObject:v6 forKey:@"parameters"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[ASTAction progress](self, "progress"), @"progress");
  objc_msgSend(v8, "encodeInteger:forKey:", -[ASTAction resultCode](self, "resultCode"), @"resultCode");
  id v7 = [(ASTAction *)self results];
  [v8 encodeObject:v7 forKey:@"resultPayload"];

  objc_msgSend(v8, "encodeBool:forKey:", -[ASTAction isFinished](self, "isFinished"), @"finished");
  objc_msgSend(v8, "encodeBool:forKey:", -[ASTAction generatedId](self, "generatedId"), @"generatedId");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)acceptableDecoderClasses
{
  if (acceptableDecoderClasses_onceToken != -1) {
    dispatch_once(&acceptableDecoderClasses_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)acceptableDecoderClasses_singleton;

  return v2;
}

uint64_t __37__ASTAction_acceptableDecoderClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  acceptableDecoderClasses_singleton = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_action copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSDictionary *)self->_parameters copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(void *)(v5 + 16) = self->_progress;
  *(void *)(v5 + 48) = self->_resultCode;
  uint64_t v12 = [(NSDictionary *)self->_results copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  *(unsigned char *)(v5 + 8) = self->_finished;
  *(unsigned char *)(v5 + 9) = self->_generatedId;
  return (id)v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ASTAction *)self action];
  uint64_t v7 = [(ASTAction *)self identifier];
  uint64_t v8 = [(ASTAction *)self parameters];
  unint64_t v9 = [(ASTAction *)self progress];
  int64_t v10 = [(ASTAction *)self resultCode];
  uint64_t v11 = [(ASTAction *)self results];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; action = %@, identifier = %@, parameters = %@, progress = %lu, resultCode = %ld, results = %@, finished = %d, generatedId = %d>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    [(ASTAction *)self isFinished],
  uint64_t v12 = [(ASTAction *)self generatedId]);

  return v12;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (BOOL)generatedId
{
  return self->_generatedId;
}

- (void)setGeneratedId:(BOOL)a3
{
  self->_generatedId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end