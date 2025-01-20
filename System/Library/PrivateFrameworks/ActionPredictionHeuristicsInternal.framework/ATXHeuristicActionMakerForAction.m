@interface ATXHeuristicActionMakerForAction
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicActionMakerForAction)initWithAction:(id)a3;
- (ATXHeuristicActionMakerForAction)initWithCoder:(id)a3;
- (id)_makeAction;
- (id)actionTypeName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicActionMakerForAction

- (ATXHeuristicActionMakerForAction)initWithAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicActionMakerForAction;
  v6 = [(ATXHeuristicActionMakerForAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_action, a3);
  }

  return v7;
}

- (id)_makeAction
{
  return self->_action;
}

- (id)actionTypeName
{
  v3 = [(ATXAction *)self->_action intent];
  v4 = [v3 _className];
  id v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = [(ATXAction *)self->_action userActivity];
    uint64_t v8 = [v7 activityType];
    objc_super v9 = (void *)v8;
    v10 = @"unknown";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v6 = v10;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicActionMakerForAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXHeuristicActionMakerForAction;
  id v5 = [(ATXHeuristicActionMaker *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (ATXAction *)v6;

    if (!v5->_action)
    {
      uint64_t v8 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXHeuristicActionMakerForAction initWithCoder:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicActionMakerForAction;
  id v4 = a3;
  [(ATXHeuristicActionMaker *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, @"action", v5.receiver, v5.super_class);
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<Lazy: %@>", self->_action];

  return v2;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end