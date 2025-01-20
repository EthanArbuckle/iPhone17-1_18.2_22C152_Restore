@interface MEMessageActionDecision
+ (BOOL)supportsSecureCoding;
+ (MEMessageActionDecision)decisionApplyingAction:(MEMessageAction *)action;
+ (MEMessageActionDecision)decisionApplyingActions:(NSArray *)actions;
+ (MEMessageActionDecision)invokeAgainWithBody;
- (BOOL)invokeAgainWithBody;
- (BOOL)isEqual:(id)a3;
- (MEMessageActionDecision)initWithActions:(id)a3 invokeAgainWithBody:(BOOL)a4;
- (MEMessageActionDecision)initWithCoder:(id)a3;
- (NSArray)actions;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageActionDecision

+ (MEMessageActionDecision)decisionApplyingAction:(MEMessageAction *)action
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = action;
  v4 = [MEMessageActionDecision alloc];
  v8[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v6 = [(MEMessageActionDecision *)v4 initWithActions:v5 invokeAgainWithBody:0];

  return v6;
}

+ (MEMessageActionDecision)decisionApplyingActions:(NSArray *)actions
{
  v3 = actions;
  v4 = [[MEMessageActionDecision alloc] initWithActions:v3 invokeAgainWithBody:0];

  return v4;
}

+ (MEMessageActionDecision)invokeAgainWithBody
{
  v2 = [[MEMessageActionDecision alloc] initWithActions:0 invokeAgainWithBody:1];
  return v2;
}

- (MEMessageActionDecision)initWithActions:(id)a3 invokeAgainWithBody:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MEMessageActionDecision;
  v8 = [(MEMessageActionDecision *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_actions, a3);
    v9->_invokeAgainWithBody = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageActionDecision)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"EFPropertyKey_invokeAgainWithBody"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_actions"];
  actions = self->_actions;
  self->_actions = v9;

  objc_super v11 = v9;
  v12 = [(MEMessageActionDecision *)self initWithActions:v11 invokeAgainWithBody:v5];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(MEMessageActionDecision *)self actions];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_actions"];

  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageActionDecision invokeAgainWithBody](self, "invokeAgainWithBody"), @"EFPropertyKey_invokeAgainWithBody");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    uint64_t v7 = [(MEMessageActionDecision *)self actions];
    v8 = [v6 actions];
    if (EFArraysAreEqual())
    {
      BOOL v9 = [(MEMessageActionDecision *)self invokeAgainWithBody];
      int v10 = v9 ^ [v6 invokeAgainWithBody] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MEMessageActionDecision *)self actions];
  id v5 = [v3 stringWithFormat:@"MEMessageActionDecision: Actions:%@, invokeAgainWithBody: %ld", v4, -[MEMessageActionDecision invokeAgainWithBody](self, "invokeAgainWithBody")];

  return v5;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)invokeAgainWithBody
{
  return self->_invokeAgainWithBody;
}

- (void).cxx_destruct
{
}

@end