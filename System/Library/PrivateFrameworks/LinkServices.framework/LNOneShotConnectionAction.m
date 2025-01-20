@interface LNOneShotConnectionAction
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (LNAction)action;
- (LNActionExecutorOptions)executorOptions;
- (LNOneShotConnectionAction)initWithBSXPCCoder:(id)a3;
- (LNOneShotConnectionAction)initWithCoder:(id)a3;
- (LNOneShotConnectionAction)initWithIdentifier:(id)a3 action:(id)a4 executorOptions:(id)a5;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNOneShotConnectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorOptions, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (LNActionExecutorOptions)executorOptions
{
  return self->_executorOptions;
}

- (LNAction)action
{
  return self->_action;
}

- (LNOneShotConnectionAction)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    v6 = -[LNConnectionAction initWithIdentifier:metadataVersion:](self, "initWithIdentifier:metadataVersion:", v5, [v4 decodeInt64ForKey:@"metadataVersion"]);
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
      action = v6->_action;
      v6->_action = (LNAction *)v7;

      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executorOptions"];
      executorOptions = v6->_executorOptions;
      v6->_executorOptions = (LNActionExecutorOptions *)v9;
    }
    self = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNConnectionAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[LNConnectionAction metadataVersion](self, "metadataVersion"), @"metadataVersion");
  v6 = [(LNOneShotConnectionAction *)self action];
  [v4 encodeObject:v6 forKey:@"action"];

  id v7 = [(LNOneShotConnectionAction *)self executorOptions];
  [v4 encodeObject:v7 forKey:@"executorOptions"];
}

- (LNOneShotConnectionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LNOneShotConnectionAction;
  v5 = [(LNConnectionAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (LNAction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executorOptions"];
    executorOptions = v5->_executorOptions;
    v5->_executorOptions = (LNActionExecutorOptions *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LNOneShotConnectionAction;
  id v4 = a3;
  [(LNConnectionAction *)&v7 encodeWithCoder:v4];
  v5 = [(LNOneShotConnectionAction *)self action];
  [v4 encodeObject:v5 forKey:@"action"];

  uint64_t v6 = [(LNOneShotConnectionAction *)self executorOptions];
  [v4 encodeObject:v6 forKey:@"executorOptions"];
}

- (LNOneShotConnectionAction)initWithIdentifier:(id)a3 action:(id)a4 executorOptions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNOneShotConnectionAction.m", 29, @"Invalid parameter not satisfying: %@", @"oneShotAction" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNOneShotConnectionAction.m", 30, @"Invalid parameter not satisfying: %@", @"executorOptions" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNOneShotConnectionAction;
  v13 = [(LNConnectionAction *)&v19 initWithIdentifier:v9 metadataVersion:1];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_action, a4);
    objc_storeStrong((id *)&v14->_executorOptions, a5);
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end