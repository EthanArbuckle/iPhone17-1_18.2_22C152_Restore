@interface ASTContext
+ (BOOL)supportsSecureCoding;
- (ASTContext)init;
- (ASTContext)initWithCoder:(id)a3;
- (ASTContext)initWithIdentity:(id)a3;
- (ASTControlCommand)controlCommand;
- (ASTIdentity)identity;
- (BOOL)testSuiteRunning;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)clientStatus;
- (int64_t)command;
- (void)encodeWithCoder:(id)a3;
- (void)setClientStatus:(int64_t)a3;
- (void)setCommand:(int64_t)a3;
- (void)setTestSuiteRunning:(BOOL)a3;
@end

@implementation ASTContext

- (ASTContext)init
{
  v3 = objc_alloc_init(ASTIdentity);
  v4 = [(ASTContext *)self initWithIdentity:v3];

  return v4;
}

- (ASTContext)initWithIdentity:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASTContext;
  v6 = [(ASTContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    v8 = objc_alloc_init(ASTControlCommand);
    controlCommand = v7->_controlCommand;
    v7->_controlCommand = v8;

    v7->_testSuiteRunning = 0;
    v7->_clientStatus = 0;
    v7->_command = 0;
  }

  return v7;
}

- (ASTContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (ASTIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"controlCommand"];
    controlCommand = v5->_controlCommand;
    v5->_controlCommand = (ASTControlCommand *)v8;

    v5->_clientStatus = [v4 decodeIntegerForKey:@"clientStatus"];
    v5->_command = [v4 decodeIntegerForKey:@"command"];
    v5->_testSuiteRunning = [v4 decodeBoolForKey:@"testSuiteRunning"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(ASTContext *)self identity];
  [v6 encodeObject:v4 forKey:@"identity"];

  id v5 = [(ASTContext *)self controlCommand];
  [v6 encodeObject:v5 forKey:@"controlCommand"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[ASTContext clientStatus](self, "clientStatus"), @"clientStatus");
  objc_msgSend(v6, "encodeInteger:forKey:", -[ASTContext command](self, "command"), @"command");
  objc_msgSend(v6, "encodeBool:forKey:", -[ASTContext testSuiteRunning](self, "testSuiteRunning"), @"testSuiteRunning");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = [(ASTIdentity *)self->_identity copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    id v8 = [(ASTControlCommand *)self->_controlCommand copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    *(void *)(v5 + 24) = self->_clientStatus;
    *(void *)(v5 + 32) = self->_command;
    *(unsigned char *)(v5 + 8) = self->_testSuiteRunning;
  }
  return (id)v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(ASTContext *)self identity];
  v7 = +[ASTRequest stringFromClientStatus:[(ASTContext *)self clientStatus]];
  id v8 = +[ASTResponse stringFromCommand:[(ASTContext *)self command]];
  v9 = [(ASTContext *)self controlCommand];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identity = %@, clientStatus = %@, command = %@, controlCommand = %@, testSuiteRunning = %d>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
  v10 = [(ASTContext *)self testSuiteRunning]);

  return v10;
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (int64_t)clientStatus
{
  return self->_clientStatus;
}

- (void)setClientStatus:(int64_t)a3
{
  self->_clientStatus = a3;
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_command = a3;
}

- (BOOL)testSuiteRunning
{
  return self->_testSuiteRunning;
}

- (void)setTestSuiteRunning:(BOOL)a3
{
  self->_testSuiteRunning = a3;
}

- (ASTControlCommand)controlCommand
{
  return self->_controlCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCommand, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end