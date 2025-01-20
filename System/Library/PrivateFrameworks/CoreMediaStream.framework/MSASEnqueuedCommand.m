@interface MSASEnqueuedCommand
+ (id)command;
+ (id)commandwithCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5;
- (BOOL)canBeGroupedWithCommand:(id)a3;
- (MSASEnqueuedCommand)init;
- (MSASEnqueuedCommand)initWithCoder:(id)a3;
- (MSASEnqueuedCommand)initWithCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5;
- (NSDictionary)invariantParam;
- (NSDictionary)variantParam;
- (NSString)command;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setInvariantParam:(id)a3;
- (void)setVariantParam:(id)a3;
@end

@implementation MSASEnqueuedCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invariantParam, 0);
  objc_storeStrong((id *)&self->_variantParam, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (void)setInvariantParam:(id)a3
{
}

- (NSDictionary)invariantParam
{
  return self->_invariantParam;
}

- (void)setVariantParam:(id)a3
{
}

- (NSDictionary)variantParam
{
  return self->_variantParam;
}

- (void)setCommand:(id)a3
{
}

- (NSString)command
{
  return self->_command;
}

- (MSASEnqueuedCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MSASEnqueuedCommand;
  v5 = [(MSASEnqueuedCommand *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    command = v5->_command;
    v5->_command = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"variant"];
    variantParam = v5->_variantParam;
    v5->_variantParam = (NSDictionary *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"invariant"];
    invariantParam = v5->_invariantParam;
    v5->_invariantParam = (NSDictionary *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  command = self->_command;
  id v8 = v4;
  if (command)
  {
    [v4 encodeObject:command forKey:@"command"];
    id v4 = v8;
  }
  variantParam = self->_variantParam;
  if (variantParam)
  {
    [v8 encodeObject:variantParam forKey:@"variant"];
    id v4 = v8;
  }
  invariantParam = self->_invariantParam;
  if (invariantParam)
  {
    [v8 encodeObject:invariantParam forKey:@"invariant"];
    id v4 = v8;
  }
}

- (BOOL)canBeGroupedWithCommand:(id)a3
{
  id v4 = a3;
  v5 = [(MSASEnqueuedCommand *)self command];
  uint64_t v6 = [v4 command];
  if (MSObjectsAreEquivalent(v5, v6))
  {
    v7 = [(MSASEnqueuedCommand *)self invariantParam];
    id v8 = [v4 invariantParam];
    BOOL v9 = MSObjectsAreEquivalent(v7, v8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (MSASEnqueuedCommand)initWithCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSASEnqueuedCommand;
  uint64_t v12 = [(MSASEnqueuedCommand *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_command, a3);
    objc_storeStrong((id *)&v13->_variantParam, a4);
    objc_storeStrong((id *)&v13->_invariantParam, a5);
  }

  return v13;
}

- (MSASEnqueuedCommand)init
{
  return [(MSASEnqueuedCommand *)self initWithCommand:0 variantParam:0 invariantParam:0];
}

+ (id)commandwithCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[MSASEnqueuedCommand alloc] initWithCommand:v9 variantParam:v8 invariantParam:v7];

  return v10;
}

+ (id)command
{
  v2 = objc_alloc_init(MSASEnqueuedCommand);
  return v2;
}

@end