@interface CCDatabaseCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommand:(id)a3;
- (BOOL)updateCommandString:(id)a3;
- (BOOL)updateParameters:(id)a3;
- (CCDatabaseCommand)init;
- (CCDatabaseCommand)initWithCommandString:(id)a3 parameters:(id)a4;
- (NSArray)parameters;
- (NSString)commandString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)replaceParameters:(id)a3;
@end

@implementation CCDatabaseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_commandString, 0);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)commandString
{
  return self->_commandString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_commandString copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSArray *)self->_parameters copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)updateParameters:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_parameters count];
  uint64_t v6 = [v4 count];
  if (v5 == v6)
  {
    v7 = (NSArray *)[v4 copy];
    parameters = self->_parameters;
    self->_parameters = v7;
  }
  return v5 == v6;
}

- (CCDatabaseCommand)initWithCommandString:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCDatabaseCommand;
  uint64_t v8 = [(CCDatabaseCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    commandString = v8->_commandString;
    v8->_commandString = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSArray *)v11;
  }
  return v8;
}

- (CCDatabaseCommand)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCDatabaseCommand;
  v3 = [(CCDatabaseCommand *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" commandString: %@, parameters: %@", self->_commandString, self->_parameters];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCDatabaseCommand *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCDatabaseCommand *)self isEqualToCommand:v5];

  return v6;
}

- (BOOL)isEqualToCommand:(id)a3
{
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    char v11 = 0;
    goto LABEL_18;
  }
  commandString = self->_commandString;
  uint64_t v9 = commandString;
  if (!commandString)
  {
    v3 = [v6 commandString];
    if (!v3)
    {
      int v10 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = self->_commandString;
  }
  id v4 = [v7 commandString];
  if (([v9 isEqual:v4] & 1) == 0)
  {

    char v11 = 0;
    goto LABEL_16;
  }
  int v10 = 1;
LABEL_10:
  parameters = self->_parameters;
  v13 = parameters;
  if (!parameters)
  {
    uint64_t v9 = [v7 parameters];
    if (!v9)
    {
      char v11 = 1;
      goto LABEL_20;
    }
    v13 = self->_parameters;
  }
  objc_super v14 = [v7 parameters];
  char v11 = [(NSArray *)v13 isEqual:v14];

  if (parameters)
  {
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_20:

  if (v10) {
LABEL_15:
  }

LABEL_16:
  if (!commandString) {

  }
LABEL_18:
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_commandString hash];
  id v4 = [(NSArray *)self->_parameters description];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (void)replaceParameters:(id)a3
{
  self->_parameters = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (BOOL)updateCommandString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  commandString = self->_commandString;
  self->_commandString = v4;

  return 1;
}

@end