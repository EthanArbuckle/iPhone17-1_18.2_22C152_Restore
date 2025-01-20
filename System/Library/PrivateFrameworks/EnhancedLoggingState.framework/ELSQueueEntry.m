@interface ELSQueueEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)retry;
- (ELSQueueEntry)init;
- (ELSQueueEntry)initWithCoder:(id)a3;
- (ELSQueueEntry)initWithType:(id)a3 typeName:(id)a4 parameters:(id)a5 executeAfterDuration:(double)a6 retry:(BOOL)a7 platform:(id)a8;
- (NSDictionary)parameters;
- (NSString)platform;
- (NSString)type;
- (NSString)typeName;
- (double)executeAfterDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setExecuteAfterDuration:(double)a3;
- (void)setParameters:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRetry:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setTypeName:(id)a3;
@end

@implementation ELSQueueEntry

- (ELSQueueEntry)init
{
  return [(ELSQueueEntry *)self initWithType:&stru_26D1285D8 typeName:&stru_26D1285D8 parameters:MEMORY[0x263EFFA78] executeAfterDuration:1 retry:&stru_26D1285D8 platform:0.0];
}

- (ELSQueueEntry)initWithType:(id)a3 typeName:(id)a4 parameters:(id)a5 executeAfterDuration:(double)a6 retry:(BOOL)a7 platform:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)ELSQueueEntry;
  v19 = [(ELSQueueEntry *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_type, a3);
    objc_storeStrong((id *)&v20->_typeName, a4);
    objc_storeStrong((id *)&v20->_parameters, a5);
    v20->_executeAfterDuration = a6;
    v20->_retry = a7;
    objc_storeStrong((id *)&v20->_platform, a8);
  }

  return v20;
}

- (ELSQueueEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ELSQueueEntry;
  v5 = [(ELSQueueEntry *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"typeName"];
    typeName = v5->_typeName;
    v5->_typeName = (NSString *)v10;

    v12 = [v4 decodeObjectForKey:@"executeAfterDuration"];
    v13 = v12;
    if (v12) {
      [v12 doubleValue];
    }
    else {
      double v14 = 0.0;
    }
    v5->_executeAfterDuration = v14;
    id v15 = [v4 decodeObjectForKey:@"retry"];
    id v16 = v15;
    if (v15) {
      char v17 = [v15 BOOLValue];
    }
    else {
      char v17 = 1;
    }
    v5->_retry = v17;
    uint64_t v18 = [v4 decodeObjectForKey:@"platform"];
    platform = v5->_platform;
    v5->_platform = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ELSQueueEntry *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  uint64_t v6 = [(ELSQueueEntry *)self typeName];
  [v4 encodeObject:v6 forKey:@"typeName"];

  v7 = [(ELSQueueEntry *)self parameters];
  [v4 encodeObject:v7 forKey:@"parameters"];

  uint64_t v8 = NSNumber;
  [(ELSQueueEntry *)self executeAfterDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v4 encodeObject:v9 forKey:@"executeAfterDuration"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ELSQueueEntry retry](self, "retry"));
  [v4 encodeObject:v10 forKey:@"retry"];

  id v11 = [(ELSQueueEntry *)self platform];
  [v4 encodeObject:v11 forKey:@"platform"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_type copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_typeName copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSDictionary *)self->_parameters copyWithZone:a3];
  id v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  *(double *)(v5 + 40) = self->_executeAfterDuration;
  *(unsigned char *)(v5 + 8) = self->_retry;
  objc_storeStrong((id *)(v5 + 48), self->_platform);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(ELSQueueEntry *)self type];
    v7 = [v5 type];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [(ELSQueueEntry *)self typeName];
      v9 = [v5 typeName];
      if ([v8 isEqualToString:v9])
      {
        [(ELSQueueEntry *)self executeAfterDuration];
        double v11 = v10;
        [v5 executeAfterDuration];
        BOOL v13 = v11 == v12;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  v14[6] = *MEMORY[0x263EF8340];
  v13[0] = @"type";
  v3 = [(ELSQueueEntry *)self type];
  v14[0] = v3;
  v13[1] = @"typeName";
  id v4 = [(ELSQueueEntry *)self typeName];
  v14[1] = v4;
  v13[2] = @"parameters";
  id v5 = [(ELSQueueEntry *)self parameters];
  v14[2] = v5;
  v13[3] = @"executeAfterDuration";
  uint64_t v6 = NSNumber;
  [(ELSQueueEntry *)self executeAfterDuration];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v14[3] = v7;
  v13[4] = @"retry";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ELSQueueEntry retry](self, "retry"));
  v14[4] = v8;
  v13[5] = @"platform";
  v9 = [(ELSQueueEntry *)self platform];
  double v10 = v9;
  if (!v9)
  {
    double v10 = [MEMORY[0x263EFF9D0] null];
  }
  v14[5] = v10;
  double v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
  if (!v9) {

  }
  return v11;
}

- (id)description
{
  v2 = NSString;
  v3 = [(ELSQueueEntry *)self dictionaryRepresentation];
  id v4 = [v3 description];
  id v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (double)executeAfterDuration
{
  return self->_executeAfterDuration;
}

- (void)setExecuteAfterDuration:(double)a3
{
  self->_executeAfterDuration = a3;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end