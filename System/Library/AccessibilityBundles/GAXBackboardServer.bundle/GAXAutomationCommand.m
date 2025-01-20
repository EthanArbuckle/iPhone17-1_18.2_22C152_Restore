@interface GAXAutomationCommand
+ (BOOL)supportsSecureCoding;
+ (id)command:(id)a3;
+ (id)command:(id)a3 parameters:(id)a4;
+ (id)commandWithData:(id)a3;
- (GAXAutomationCommand)initWithCoder:(id)a3;
- (NSDictionary)parameters;
- (NSSecureCoding)result;
- (NSString)command;
- (NSString)errorMessage;
- (id)data;
- (id)description;
- (void)addParameter:(id)a3 forKey:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setParameters:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation GAXAutomationCommand

+ (id)command:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(GAXAutomationCommand);
  [(GAXAutomationCommand *)v4 setCommand:v3];

  return v4;
}

+ (id)command:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  v7 = [a1 command:a3];
  [v7 setParameters:v6];

  return v7;
}

- (id)description
{
  id v3 = [(GAXAutomationCommand *)self command];
  v4 = [(GAXAutomationCommand *)self result];
  v5 = [(GAXAutomationCommand *)self errorMessage];
  id v6 = [(GAXAutomationCommand *)self parameters];
  v7 = +[NSString stringWithFormat:@"GAX-UIA<%p>. Command:%@ Result:%@ Error:%@ Parameters:%@", self, v3, v4, v5, v6];

  return v7;
}

- (void)addParameter:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(GAXAutomationCommand *)self parameters];
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
  }
  [v8 setObject:v9 forKeyedSubscript:v6];
  [(GAXAutomationCommand *)self setParameters:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GAXAutomationCommand *)self command];
  [v4 encodeObject:v5 forKey:@"command"];

  id v6 = [(GAXAutomationCommand *)self result];
  [v4 encodeObject:v6 forKey:@"result"];

  v7 = [(GAXAutomationCommand *)self errorMessage];
  [v4 encodeObject:v7 forKey:@"error"];

  id v8 = [(GAXAutomationCommand *)self parameters];
  [v4 encodeObject:v8 forKey:@"parameters"];
}

- (GAXAutomationCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GAXAutomationCommand;
  v5 = [(GAXAutomationCommand *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    [(GAXAutomationCommand *)v5 setCommand:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    [(GAXAutomationCommand *)v5 setErrorMessage:v7];

    id v8 = [v4 decodePropertyListForKey:@"result"];
    [(GAXAutomationCommand *)v5 setResult:v8];

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"parameters"];
    [(GAXAutomationCommand *)v5 setParameters:v12];
  }
  return v5;
}

+ (id)commandWithData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

- (id)data
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSSecureCoding)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

@end