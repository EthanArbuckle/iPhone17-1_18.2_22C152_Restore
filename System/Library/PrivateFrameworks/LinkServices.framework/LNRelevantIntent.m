@interface LNRelevantIntent
+ (BOOL)supportsSecureCoding;
- (LNAction)action;
- (LNRelevantContext)context;
- (LNRelevantIntent)initWithBundleIdentifier:(id)a3 action:(id)a4 widgetKind:(id)a5 context:(id)a6;
- (LNRelevantIntent)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)widgetKind;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNRelevantIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (LNRelevantContext)context
{
  return self->_context;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (LNAction)action
{
  return self->_action;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNRelevantIntent *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(LNRelevantIntent *)self action];
  [v4 encodeObject:v6 forKey:@"action"];

  v7 = [(LNRelevantIntent *)self widgetKind];
  [v4 encodeObject:v7 forKey:@"widgetKind"];

  id v8 = [(LNRelevantIntent *)self context];
  [v4 encodeObject:v8 forKey:@"context"];
}

- (LNRelevantIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetKind"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = [(LNRelevantIntent *)self initWithBundleIdentifier:v5 action:v6 widgetKind:v7 context:v8];
    v11 = self;
  }
  v12 = v11;

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(LNRelevantIntent *)self bundleIdentifier];
  v5 = [(LNRelevantIntent *)self action];
  v6 = [(LNRelevantIntent *)self context];
  v7 = [v3 stringWithFormat:@"{%@:%@, %@}", v4, v5, v6];

  return v7;
}

- (LNRelevantIntent)initWithBundleIdentifier:(id)a3 action:(id)a4 widgetKind:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LNRelevantIntent;
  v14 = [(LNRelevantIntent *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    action = v14->_action;
    v14->_action = (LNAction *)v17;

    uint64_t v19 = [v12 copy];
    widgetKind = v14->_widgetKind;
    v14->_widgetKind = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    context = v14->_context;
    v14->_context = (LNRelevantContext *)v21;

    v23 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end